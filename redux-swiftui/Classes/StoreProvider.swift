//
//  StoreProvider.swift
//  redux-swiftui
//
//  Created by yun.ao on 2022/9/29.
//

import SwiftUI

public struct StoreProvider<S: State, V: View>: View {
    public let store: Store<S>
    public let content: () -> V
    
    public init(store: Store<S>, content: @escaping () -> V) {
        self.store = store
        self.content = content
    }
    
    public var body: some View {
        content().environmentObject(store)
    }
}
