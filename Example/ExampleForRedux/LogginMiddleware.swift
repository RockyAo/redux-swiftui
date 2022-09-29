//
//  LogginMiddleware.swift
//  ExampleForRedux
//
//  Created by yun.ao on 2022/9/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import redux_swiftui

let loggingMiddleware: Middleware<AppState> = { (state, action) in
    #if DEBUG
    print("excute the action: \(action)")
    print("state is : \(state)")
    #endif
}
