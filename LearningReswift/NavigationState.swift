//
//  NavigationState.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

enum NavigationState: String {
    case login = "FormController"
    
    var controller: UIViewController {
        switch self {
        case .login:
            return FormController()
        }
    }
}
