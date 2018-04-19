//
//  FetchQuestionAction.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

struct FetchQuestionAction : Action {
    let model: [QuestionModel?]
}

func fetchQuestion(state: AppState, store: Store<AppState>) -> FetchQuestionAction{
    NetwokManager.request(target: .question, success: { (response) in
        do {
            let decoder = JSONDecoder()
            let response: [QuestionModel] = try decoder.decode([QuestionModel].self, from: response.data)
            DispatchQueue.main.async {
                store.dispatch(FetchQuestionAction(model: response))
            }
        }catch {
            store.dispatch(RequestErrorAction(error: "parsing data failed"))
        }
    }, error: { (error) in
        
    }) { (moyaErro) in
        
    }
    
    return FetchQuestionAction(model: [])
}
