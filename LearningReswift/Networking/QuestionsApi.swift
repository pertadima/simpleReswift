//
//  QuestionsApi.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import Moya

enum QuestionsApi {
    case question
}

extension QuestionsApi : TargetType {
    var baseURL: URL {
        return URL(string: "https://private-965f0-assessment5.apiary-mock.com")!
    }
    
    var path: String {
        switch self {
        case .question:
            return "/questions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json","Accept":"application/json"]
    }
}

