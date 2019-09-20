import UIKit

class WalkthroughViewController: UIViewController {

    //==================================================
    // MARK: - Presentation
    //==================================================

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    private let stacKView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    //==================================================
    // MARK: - Routing
    //==================================================

    //==================================================
    // MARK: - UIViewController override
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

extension WalkthroughViewController {

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        scrollView.addSubview(stacKView)
        stacKView.translatesAutoresizingMaskIntoConstraints = false
        stacKView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stacKView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stacKView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        stacKView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

    }
    
}
