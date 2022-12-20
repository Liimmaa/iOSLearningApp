//
//  StateMachine.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 28/11/2022.
//

import Foundation

open class StateMachine<State, Event>: NSObject, ObservableObject, StateMachineProtocol where State: Equatable {

    public init(_ initialState: State) {
        self.state = initialState
    }

    @Published public var stateError: Error?

    @Published private(set) public var state: State {
        willSet {
            leaveState(state)
        }

        didSet {
            enterState(state)
            handleStateUpdate(oldValue, new: state)
        }
    }

    open func handleStateUpdate(_ oldState: State, new newState: State) {
        fatalError("Override handleStateUpdate(_:, new:) before continuing.")
    }

    open func handleEvent(_ event: Event) -> State? {
        fatalError("Override handleEvent(_:) before continuing.")
    }

    open func send(event: Event) {
        if let state = handleEvent(event) {
          self.state = state
        }
    }

    open func leaveState(_ state: State) {}
    open func enterState(_ state: State) {}
}
