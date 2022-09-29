//
//  Store.swift
//  redux-swiftui
//
//  Created by yun.ao on 2022/9/29.
//

import Foundation
import Combine

final public class Store<S: State>: ObservableObject {
    @Published
    public private(set) var state: S
    
    private let reducer: Reducer<S>
    private let middlewares: [Middleware<S>]
    private let enviorment: Enviorment
    
    private var disposeBags: [UUID: Cancellable] = [:]
    
    public init(
        reducer: @escaping Reducer<S>,
        state: S,
        middlewares: [Middleware<S>] = [],
        enviorment: Enviorment
    ) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
        self.enviorment = enviorment
    }
    
    @discardableResult
    public func dispatch(_ action: Action) -> UUID {
        let effect = reducer(&state, action, enviorment)
        
        var didComplete = false
        let uuid = UUID()
        
        middlewares.forEach { middleware in
            middleware(&state, action)
        }
        
        let cancellable = effect
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] _ in
                    didComplete = true
                    self?.disposeBags[uuid] = nil
                },
                receiveValue: { [weak self] effectAction in
                    self?.dispatch(effectAction)
                }
            )
        
        if !didComplete {
            disposeBags[uuid] = cancellable
        }
        
        return uuid
    }
    
    func cancelActionsInExcuting(_ uuid: UUID? = nil) {
        if let uuid = uuid {
            disposeBags[uuid]?.cancel()
            disposeBags[uuid] = nil
            return
        }
        
        
        disposeBags.values.forEach { $0.cancel() }
        disposeBags.removeAll()
    }
}

