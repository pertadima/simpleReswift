//
//  FormController.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/15/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import UIKit
import ReSwift

class FormController : UIViewController, StoreSubscriber {
    lazy var myForm = UITextField()
    lazy var myButton = UIButton()
    lazy var myText = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.formState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myForm)
        view.addSubview(myButton)
        view.addSubview(myText)
        
        
        let margins = view.layoutMarginsGuide
        
        //constraint edit text
        myForm.translatesAutoresizingMaskIntoConstraints = false
        myForm.topAnchor.constraint(equalTo: margins.topAnchor, constant : 100).isActive = true
        myForm.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        myForm.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        myForm.placeholder = "Masukkan text disini"
        
        //constraint button
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: myForm.bottomAnchor, constant : 20).isActive = true
        myButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        myButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        myButton.backgroundColor = .red
        myButton.setTitle("Submit", for: UIControlState.normal)
        myButton.heightAnchor.constraint(equalToConstant: 40)
        
        //constraint text
        
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant : 20).isActive = true
        myText.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        myText.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        myText.textColor = .red
    }
    
    func newState(state: FormState)
    {
        myForm.text = state.value
        print(state.value)
        myText.text = state.value
        myButton.addTarget(self, action: #selector(formAction), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func formAction()
    {
        let routeDestination: NavigationState = .login
        store.dispatch(RoutingAction(destination: routeDestination,value: myForm.text!))
    }
}

