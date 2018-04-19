//
//  UIView.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func constraintEntireSuperview(toView: UIView, value: CGFloat) {
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.topAnchor, constant:value).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.bottomAnchor, constant: -value).isActive = true
            self.leftAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.leftAnchor, constant: value).isActive = true
            self.rightAnchor.constraint(equalTo: toView.safeAreaLayoutGuide.rightAnchor, constant: -value).isActive = true
        }else{
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: value).isActive = true
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -value).isActive = true
            self.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: value).isActive = true
            self.rightAnchor.constraint(equalTo: toView.rightAnchor, constant: -value).isActive = true
        }
        
    }
}
