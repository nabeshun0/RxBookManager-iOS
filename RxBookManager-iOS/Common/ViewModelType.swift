//
//  ViewModelType.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/28.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
