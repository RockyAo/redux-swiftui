//
//  Middleware.swift
//  redux-swiftui
//
//  Created by yun.ao on 2022/9/29.
//

import Foundation
import Combine

public typealias Middleware<S: State> = (_ state: inout S, _ action: Action) -> Void
