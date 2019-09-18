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

    private var limit = Constants.Api.limitPageNum
    private var currentPage = Constants.Api.currentPageNum

    private lazy var addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(title: "追加", style: .plain, target: self, action: #selector(showRegisterBookVC))
        return addButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = Constants.Size.tableViewRowHeight
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookListTableViewCell.self, forCellReuseIdentifier: BookListTableViewCell.className)
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
         let cell: BookListTableViewCell = tableView.dequeueReusableCell(withIdentifier: BookListTableViewCell.className, for: indexPath) as! BookListTableViewCell

        cell.accessoryType = .disclosureIndicator
        cell.configureWithBook(book: viewModel.books[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let book = viewModel.books[indexPath.row]
        routing.showDetailBookVC(book: book)
    }
}
