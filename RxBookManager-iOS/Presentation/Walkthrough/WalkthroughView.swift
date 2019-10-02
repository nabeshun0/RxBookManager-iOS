import UIKit

extension WalkthroughView {
    enum Layout {
        case first
        case second
        case third

        var title: String {
            switch self {
            case .first:
                return "hogehoge"
            case .second:
                return "fugafuga"
            case .third:
                return "hogefuga"
            }
        }

        var description: String {
            switch self {
            case .first:
                return "hogehogehogehogehogehogehogehogehogehoge"
            case .second:
                return "hogehogehogehogehogehogehogehogehogehoge"
            case .third:
                return "hogehogehogehogehogehogehogehogehogehoge"
            }
        }

        var image: UIImage {
            switch self {
            case .first:
                return #imageLiteral(resourceName: "bookIconTab")
            case .second:
                return #imageLiteral(resourceName: "settingIconTab")
            case .third:
                return #imageLiteral(resourceName: "bookIcon")
            }
        }
    }
}

final class WalkthroughView: UIView {

    let descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Screen Shot 2019-05-20 at 20.12.36")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "fugafuga"
        return label
    }()

    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .white
        return pageControl
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.backgroundColor = .lightGray
        self.addSubview(descriptionImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionTextView)
        self.addSubview(pageControl)

        descriptionImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        descriptionImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        descriptionImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: descriptionImageView.bottomAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionTextView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 30).isActive = true
        
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }

    func applyUI(view: WalkthroughView.Layout) {
        titleLabel.text = view.title
        descriptionTextView.text = view.description
        descriptionImageView.image = view.image
    }
}
