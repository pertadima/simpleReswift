//
//  NetworkManager.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import Moya

struct NetwokManager: PluginType {
    
    static func request(target: QuestionsApi, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (Response) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        let token: String = "token"
        let authPlugin = AccessTokenPlugin(tokenClosure: token)
        let provider = MoyaProvider<QuestionsApi>(plugins: [NetworkLoggerPlugin(verbose: true),authPlugin])
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    errorCallback(response)
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}


