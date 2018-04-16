//
//  AppReducers.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

func appReducer (action : Action, state: AppState?)-> AppState{
    return AppState(routingState: routingReducer(action: action, state: state?.routingState),formState: formReducer(actions: action, state: state?.formState))
}
