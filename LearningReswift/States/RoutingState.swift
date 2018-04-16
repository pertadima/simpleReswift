//
//  RoutingState.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

struct RoutingState: StateType {
    var navigationState: NavigationState
    
    init(navigationState: NavigationState = .login) {
        self.navigationState = navigationState
    }
}
