//
//  FormReducers.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

func formReducer(actions : Action, state : FormState?) ->FormState{
    var state = state ?? FormState()
    switch actions {
    case let action as RoutingAction:
        state.value = action.value
    default:
        break
    }
    return state
}
