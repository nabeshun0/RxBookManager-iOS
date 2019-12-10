import Foundation

public class LocalDataStore {
    public static func getToken() -> String {
        return getString(key: "token")
    }

    public static func saveToken(value: String) {
        saveString(value: value, key: "token")
    }

    public static func clearToken() {
        saveString(value: "", key: "token")
    }
}

extension LocalDataStore {
    public static func getString(key: String) -> String {
        let userDefault = UserDefaults.standard
        return userDefault.string(forKey: key) ?? ""
    }

    public static func saveString(value: String, key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
    }
}
