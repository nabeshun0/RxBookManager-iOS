import Foundation

final class CommmonUserDefaults {
    static func getToken() -> String {
        return getString(key: "token")
    }

    static func saveToken(value: String) {
        saveString(value: value, key: "token")
    }
}

extension CommmonUserDefaults {
    static func getString(key: String) -> String {
        let userDefault = UserDefaults.standard
        return userDefault.string(forKey: key) ?? ""
    }

    static func saveString(value: String, key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
    }
}
