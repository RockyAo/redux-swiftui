//
//  AppState.swift
//  ExampleForRedux
//
//  Created by yun.ao on 2022/9/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import redux_swiftui

struct AppState: State {
    var number: Int = 0
    var isLoading = false
    var isFinished = false
}
