import Foundation
import UIKit
import RxSwift

final class BookListViewController: UIViewController {

    private var viewModel: BookListViewModel

    init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //==================================================
    // MARK: - Presentation
    //==================================================

    //    private var books: [BookListResponse.Book] = []
    private var limit = Constants.Api.limitPageNum
    private var currentPage = Constants.Api.currentPageNum

    struct Book {
        let bookImage: UIImage?
        let bookTitle: UILabel?
        let bookPrice: UILabel?
        let bookID: UILabel?
    }

    private lazy var addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(title: "追加", style: .plain, target: self, action: #selector(showAddBookVC))
        return addButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = Constants.Size.tableViewRowHeight
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookListTableViewCell.self, forCellReuseIdentifier: String(describing: BookListTableViewCell.self))
        return tableView
    }()

    private lazy var addLoadingPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("更新", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.adjustsImageWhenDisabled = true
        return button
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .black
        return activityIndicator
    }()

    @objc private func showRegisterBookVC() {
        routing.showRegisterBookVC()
    }

    //==================================================
    // MARK: - Routing
    //==================================================

    private lazy var routing: BookListRouting = {
        let routing = BookListRoutingImpl()
        routing.viewController = self
        routing.navigationController = self.navigationController
        return routing
    }()

    //==================================================
    // MARK: - Rx
    //==================================================

    private let disposeBag: DisposeBag = .init()

    //==================================================
    // MARK: - UIViewController override
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupNavItem()
        bindUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        // テーブルビューをリフレッシュ
        activityIndicator.startAnimating()
        //        books = []
        tableView.reloadData()
        currentPage = Constants.Api.currentPageNum
        //        sendRequest(limit: limit, page: currentPage)
    }

    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.stopAnimating()
    }
}

extension BookListViewController {
    private func setupUI() {

        [tableView, addLoadingPageButton]
            .forEach {
                self.view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubview(activityIndicator)

        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         tableView.widthAnchor.constraint(equalToConstant: view.frame.width),

         addLoadingPageButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
         addLoadingPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         addLoadingPageButton.leftAnchor.constraint(equalTo: view.leftAnchor),
         addLoadingPageButton.widthAnchor.constraint(equalToConstant: view.frame.width),
         addLoadingPageButton.heightAnchor.constraint(equalToConstant: Constants.Constraint.addLoadPageButtonHeightConstraint)]
            .forEach {
                $0.isActive = true
        }

    }

    private func setupNavItem() {
        title = "書籍一覧"
        navigationItem.rightBarButtonItem = addButton
    }

    private func bindUI() {

        let input = BookListViewModel.Input(didReloadButtonTapped: addLoadingPageButton.rx.tap.asObservable(), viewWillAppear: rx.sentMessage(#selector(viewWillAppear(_:))).asObservable())

        let output = viewModel.transform(input: input)

        output.result.subscribe(onNext: { [weak self] result in
            self?.viewModel.books += result.result
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)

        output.error.subscribe(onNext: { [weak self] error in
            self?.createAlert(message: error.localizedDescription)
        }).disposed(by: disposeBag)

        output.firstResult.subscribe(onNext: { [weak self] result in
            self?.viewModel.books += result.result
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)

        output.firstError.subscribe(onNext: { [weak self] error in
            self?.createAlert(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellの生成
        guard let cell: BookListTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: BookListTableViewCell.self), for: indexPath) as? BookListTableViewCell else { return UITableViewCell() }
        //        cell.accessoryType = .disclosureIndicator
        //        cell.configureWithBook(book: books[indexPath.item])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //        let book = books[indexPath.item]
        //        let image = book.image ?? Constants.emptyString
        //        let price = book.price ?? Constants.emptyInt
        //        let purchaseDate = book.purchaseDate ?? Constants.emptyString
        //        AuthManager.setBook(book.id, forKey: Constants.Api.id)
        //        AuthManager.setBook(book.name, forKey: Constants.Api.name)
        //        AuthManager.setBook(image, forKey: Constants.Api.image)
        //        AuthManager.setBook(price, forKey: Constants.Api.price)
        //        AuthManager.setBook(purchaseDate, forKey: Constants.Api.purchaseDate)
        //        AuthManager.userDefault.synchronize()
        routing.showDetailBookVC()
    }
}

//
//    private func sendRequest(limit: Int, page: Int) {
//        DispatchQueue.global(qos: .default).async {
//            Session.send(BookListRequest(limit: limit, page: page), handler: { (result) in
//                switch result {
//                case .success(let response):
//                    response.result.forEach({ data in
//                        self.books.append(data)
//                    })
//                    self.tableView.reloadData()
//                case .failure(.requestError(let APIError as APIError)):
//                    print(APIError.message)
//                case .failure(let error):
//                    print(error)
//                }
//            })
//        }
//    }
//
//    @objc private func fetchPage() {
//        currentPage += 1
//        sendRequest(limit: limit, page: currentPage)
//    }



