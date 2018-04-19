//
//  AppRouter.swift
//  LearningReswift
//
//  Created by Irfan pertadima on 4/16/18.
//  Copyright © 2018 Irfan pertadima. All rights reserved.
//

import Foundation
import ReSwift

final class AppRouter {
    
    var navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        // 1
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }	
    }
    
    // 2
    fileprivate func navigateToViewController(state: RoutingState, dismiss: Bool,animated: Bool) {
        let viewController = state.navigation.controller
        viewController.title = state.navigation.rawValue
        let newViewControllerType = type(of: viewController)
        if let currentVc = navigationController.topViewController {
            let currentViewControllerType = type(of: currentVc)
            if currentViewControllerType == newViewControllerType && !dismiss{
                return
            }
        }
        let vc = UINavigationController(rootViewController: viewController)
        switch state.segue {
        case .present:
            navigationController.present(vc, animated: animated, completion: nil)
        case .dismiss:
            navigationController.dismiss(animated: true, completion: nil)
        case .presentToPresent:
            navigationController.dismiss(animated: true, completion: nil)
            navigationController.present(vc, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}

// MARK: - StoreSubscriber
// 3
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        let shouldAnimate = navigationController.topViewController != nil
        if let nc = state.currentController { navigationController = nc }
        if state.nextNavigation {
            navigateToViewController(state: state, dismiss: state.dismiss ,animated: shouldAnimate)
        }
    }
}
