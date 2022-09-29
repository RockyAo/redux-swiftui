//
//  ContentView.swift
//  ExampleForRedux
//
//  Created by yun.ao on 2022/9/29.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import redux_swiftui

struct ContentView: View {
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        VStack {
            Text("\(store.state.number)")
            
            Button("+") {
                store.dispatch(Actions.increase)
            }
            
            Button("-") {
                store.dispatch(Actions.decrease)
            }
            
            Button("重置状态") {
                store.dispatch(Actions.clearState)
            }
            
            if store.state.isFinished {
                Text("异步执行完成")
            } else {
                Button("异步演示") {
                    store.dispatch(Actions.asyncTest)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
