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
                return #imageLiteral(resourceName: "Octocat-400x400")
            case .second:
                return #imageLiteral(resourceName: "9d4d314ec7722d05541111a180e4e54b")
            case .third:
                return #imageLiteral(resourceName: "D6OgILOW0AUe7qo")
            }
        }
    }
}

final class WalkthroughView: UIView {

    let descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Octocat-400x400")
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
    }

    func applyUI(view: WalkthroughView.Layout) {
        titleLabel.text = view.title
        descriptionTextView.text = view.description
        descriptionImageView.image = view.image
    }
}
