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
    func fetchBook(_ params: FetchBookListModel) -> Observable<FetchBookListAPI.Response>
    func registerBook(_ params: RegisterBookModel) -> Observable<RegisterBookAPI.Response>
    func updateBook(_ params: DetailBookModel) -> Observable<DetailBookAPI.Response>
}

final class BookRepositoryImpl: BookRepository {

    static let shared = BookRepositoryImpl()

    private let dataStore = BookDataStoreFactory.createBookDataStore()

    func fetchBook(_ params: FetchBookListModel) -> Observable<FetchBookListAPI.Response> {
        return dataStore.fetchBook(fetchBookList: params)
    }

    func registerBook(_ params: RegisterBookModel) -> Observable<RegisterBookAPI.Response> {
        return dataStore.registerBook(registerBook: params)
    }

    func updateBook(_ params: DetailBookModel) -> Observable<DetailBookAPI.Response> {
        return dataStore.updateBook(detailBook: params)
    }
}
