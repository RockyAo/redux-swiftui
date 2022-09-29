//
//  Actions.swift
//  ExampleForRedux
//
//  Created by yun.ao on 2022/9/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import redux_swiftui

enum Actions: Action {
    case increase
    case decrease
    case asyncTest
    case asyncDone
    case clearState
}
