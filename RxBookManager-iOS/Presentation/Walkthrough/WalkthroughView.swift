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

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "fugafuga"
        return label
    }()

    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        return textView
    }()

    let descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "bookIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

    func applyUI(view: WalkthroughView.Layout) {
        titleLabel.text = view.title
        descriptionTextView.text = view.description
        descriptionImageView.image = view.image
    }
}
