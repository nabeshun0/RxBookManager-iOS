import Foundation
import UIKit

protocol ImageConvertable {
    func convertImageToString(image: UIImage) -> String
}

extension ImageConvertable where Self: UIViewController {
    func convertImageToString(image: UIImage) -> String {
        guard let imageData = image.pngData() else { return "No Image" }
        let imageDataTypeString = imageData.base64EncodedString()
        return imageDataTypeString
    }
}
