//
//  QuestionTableViewCell.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/19/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import UIKit

class QuestionTableViewCell: UITableViewCell {
    class var identifier: String { return String.className(self) }
    var label: UILabel = {
        return UILabel()
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .red
        label.constraintEntireSuperview(toView: self, value: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: QuestionModel) {
        label.text = model.question
    }
}
