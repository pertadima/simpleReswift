//
//  QuestionReducers.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

func questionReducer(action: Action, state: QuestionState?)->QuestionState{
    var state = state ?? QuestionState(questionModel: [])
    switch action {
    case let action as FetchQuestionAction:
        state.questionModel = action.model
    default:
        break
    }
    return state
}
