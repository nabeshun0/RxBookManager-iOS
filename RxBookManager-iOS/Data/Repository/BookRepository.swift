//
//  BookRepository.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/28.
//  Copyright © 2019 nabezawa. All rights reserved.
//
import RxSwift
import APIKit

protocol BookRepository {
    func fetchBook(_ params: BookListModel) -> Observable<FetchBookListAPI.Response>
    func registerBook(_ params: BookModel) -> Observable<RegisterBookAPI.Response>
    func updateBook(_ params: BookModel) -> Observable<UpdateBookAPI.Response>
}

final class BookRepositoryImpl: BookRepository {

    static let shared = BookRepositoryImpl()

    private let dataStore = BookDataStoreFactory.createBookDataStore()

    func fetchBook(_ params: BookListModel) -> Observable<FetchBookListAPI.Response> {
        return dataStore.fetchBook(with: params)
    }

    func registerBook(_ params: BookModel) -> Observable<RegisterBookAPI.Response> {
        return dataStore.registerBook(with: params)
    }

    func updateBook(_ params: BookModel) -> Observable<UpdateBookAPI.Response> {
        return dataStore.updateBook(with: params)
    }
}
