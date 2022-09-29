//
//  Reducers.swift
//  ExampleForRedux
//
//  Created by yun.ao on 2022/9/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import redux_swiftui
import Combine


let appStateReducer: Reducer<AppState> = { (state: inout AppState, action: Action, enviorment) -> AnyPublisher<Action, Never> in
    if let action = action as? Actions {
        switch action {
        case .increase:
            state.number += 1
        case .decrease:
            state.number -= 1
        case .asyncTest:
            print("执行异步操作，开始睡眠")
            return Just(Actions.asyncDone)
                .delay(for: .seconds(5), scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        case .asyncDone:
            state.isFinished = true
            break
        case .clearState:
            state.isFinished = false
            state.number = 0
        }
    }

    return Empty(completeImmediately: true)
        .eraseToAnyPublisher()
}
