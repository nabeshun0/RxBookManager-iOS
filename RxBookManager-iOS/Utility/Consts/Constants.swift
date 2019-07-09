import Foundation
import UIKit

struct Constants {

    static let emptyString = ""
    static let emptyInt = 0

    struct Constraint {
        // addLoadPageButton
        static let addLoadPageButtonHeightConstraint: CGFloat = 50
        // bookImage
        static let bookImageHeightConstraint: CGFloat = 130
        static let bookImageWidthConstraint: CGFloat = 130
        static let bookImageLeftConstraint: CGFloat = 30
        static let bookImageTopConstraint: CGFloat = 30
        // imagePutButton
        static let imagePutButtonLeftConstraint: CGFloat = 25
        static let imagePutButtonRightConstraint: CGFloat = -40
        static let imagePutButtonHeightConstraint: CGFloat = 60
        // label
        static let labelTopConstraint: CGFloat = 30
        static let labelLeftConstraint: CGFloat = 10
        // textField
        static let textFieldTopConstraint: CGFloat = 8
        static let textFieldRightConstraint: CGFloat = -10
        static let textFieldHeightConstraint: CGFloat = 40
        // bookImageInCell
        static let bookImageTopConstraintInCell: CGFloat = 20
        static let bookImageleftConstraintInCell: CGFloat = 10
        static let bookImageWidthConstraintInCell: CGFloat = 120
        static let bookImageHeightConstraintInCell: CGFloat = 120
        // titleInCell
        static let titleLeftConstraintInCell: CGFloat = 10
        // purchaseDateCell
        static let purchaseDateLeftConstraintInCell: CGFloat = 20
    }

    struct Flag {
        static let bookListTabBarFlag = 1
        static let logoutTabBarFlag = 2
    }

    struct Size {
        // tableView
        static let tableViewRowHeight: CGFloat = 160
        // imageView
        static let imageViewBorderWidth: CGFloat = 1
        // fontSize
        static let fontSizeSmall: CGFloat = 12
        static let fontSizeMiddle: CGFloat = 15
        static let fontSizeLarge: CGFloat = 18
        // buttonCornerRadius
        static let buttonCornerRadius: CGFloat = 5
    }

    struct DictKey {
        static let firstLaunch = "firstLaunch"
    }

    struct Api {
        static let limitPageNum: Int = 5
        static let pageNum: Int = 1
        static let currentPageNum: Int = 1
        static let token = "token"
        static let id = "id"
        static let name = "name"
        static let image = "image"
        static let price = "price"
        static let purchaseDate = "purchaseDate"
        static let baseURL = "http://54.250.239.8"
    }
}
