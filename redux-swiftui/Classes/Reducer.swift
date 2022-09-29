//
//  Reducer.swift
//  redux-swiftui
//
//  Created by yun.ao on 2022/9/29.
//

import Combine

public typealias Reducer<S: State> = (_ state: inout S,_ action: Action, _ enviorment: Enviorment)  -> AnyPublisher<Action, Never>
