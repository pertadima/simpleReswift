//
//  QuestionTableView.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/19/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import UIKit

class QuestionTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var model: [QuestionModel?] = []
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initTableView(model: [QuestionModel?]) {
        self.model = model
        
        self.reloadData()
        print(self.model.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QuestionTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: QuestionTableViewCell.identifier)
        cell.configureCell(model: model[indexPath.row]!)
        return cell
    }
}

