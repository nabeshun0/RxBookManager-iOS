//
//  BookRepository.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/28.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation

protocol BookRepository {
    func fetchBook()
    func registerBook()
    func updateBook()
}

final class BookRepositoryImpl: BookRepository {

    static let shared = BookRepositoryImpl()

    private let dataStore = BookDataStoreFactory.createBookDataStore()

    func fetchBook() {

    }

    func registerBook() {

    }

    func updateBook() {

    }
}
