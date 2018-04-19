//
//  RoutingReducers.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    switch action {
    case let action as RoutingAction:
        state.navigation = action.destination
        state.segue = action.segue
        state.nextNavigation = true
        state.dismiss = action.segue == .dismiss || action.segue == .presentToPresent
    case let actions as RoutingControllerAction:
        state.currentController = actions.controller
        state.nextNavigation = false
    default:
        state.nextNavigation = false
        state.dismiss = false
    }
    return state
}
