import APIKit
import Foundation

enum APIRoutes {
    case login         // ログイン
    case signUp        // 新規登録
    case logout        // ログアウト
    case fetchBookList // 書籍一覧取得
    case registerBook  // 書籍登録
    case editBook      // 書籍情報取得

    func configurePath() -> (method: HTTPMethod, path: String) {
        switch self {
        case .login: return (.post, "/login")
        case .signUp: return (.post, "/sign_up")
        case .logout: return (.delete, "/logout")
        case .fetchBookList: return (.get, "/books")
        case .registerBook: return (.post, "/books")
        case .editBook: return (.put, "/books")
        }
    }
}
