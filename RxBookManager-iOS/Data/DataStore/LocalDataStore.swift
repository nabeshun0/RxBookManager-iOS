//
//  LocalDataStore.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/12/08.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation

final class LocalDataStore {
    static func getToken() -> String {
        return getString(key: "token")
    }

    static func saveToken(value: String) {
        saveString(value: value, key: "token")
    }

    static func clearToken() {
        saveString(value: "", key: "token")
    }
}

extension LocalDataStore {
    static func getString(key: String) -> String {
        let userDefault = UserDefaults.standard
        return userDefault.string(forKey: key) ?? ""
    }

    static func saveString(value: String, key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
    }
}
