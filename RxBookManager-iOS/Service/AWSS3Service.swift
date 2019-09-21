import AWSS3
import RxSwift

enum AWSS3Result<T> {
    case success(T)
    case failure(Error)
}

final class AWSS3Service: NSObject {

    struct authKey {
        static let accesskey: String = ""
        static let secretkey: String = ""
        static let bucketName: String = ""
    }

    private func setup(completion: @escaping (AWSS3Service) -> Void) {

    }
}

extension AWSS3Service {
    // 処理結果はクロージャーで渡す
    func uploadImage() {

    }

    func downloadImage() {

    }
}
