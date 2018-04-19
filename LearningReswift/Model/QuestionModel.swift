//
//  QuestionModel.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation

struct QuestionModel : Decodable {
    let question : String
    let published_at : String
    let choices : [String]}
