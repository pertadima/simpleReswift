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
    var navigation: NavigationState
    var segue: Segue
    var currentController: UINavigationController?
    var nextNavigation: Bool
    var dismiss: Bool = false
    
    init(navigation: NavigationState = .login, segue: Segue = .push, next: Bool = false) {
        self.navigation = navigation
        self.segue = segue
        self.nextNavigation = next
    }
}
