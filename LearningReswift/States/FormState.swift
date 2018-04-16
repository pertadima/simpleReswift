//
//  FormState.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

struct FormState: StateType{
    var value : String
    init ()
    {
        value = "current value"
    }
}
