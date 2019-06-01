//
//  RootContainerViewController.swift
//  SplashDemo
//
//  Created by ShuichiNagao on 2019/06/01.
//  Copyright © 2019 Shuichi Nagao. All rights reserved.
//

import UIKit

class RootContainerViewController: UIViewController {
    
    fileprivate var rootViewController: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSplashViewController()
    }
    
    /// Does not transition to any other UIViewControllers, SplashViewController only
    func showSplashViewControllerNoPing() {
        
        if rootViewController is SplashViewController {
            return
        }
        
        rootViewController?.willMove(toParent: nil)
        rootViewController?.removeFromParent()
        rootViewController?.view.removeFromSuperview()
        rootViewController?.didMove(toParent: nil)
        
        let splashViewController = SplashViewController(tileViewFileName: "Chimes")
        rootViewController = splashViewController
        splashViewController.pulsing = true
        
        splashViewController.willMove(toParent: self)
        addChild(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
    }
    
    /// Simulates an API handshake success and transitions to MapViewController
    func showSplashViewController() {
        showSplashViewControllerNoPing()
        
        delay(6.00) {
            self.showMenuNavigationViewController()
        }
    }
    
    /// Displays the MapViewController
    func showMenuNavigationViewController() {
        guard !(rootViewController is MenuNavigationViewController) else { return }
        
        let storyboard = UIStoryboard(name: "MenuNavigationViewController", bundle: nil)
        let nav =  storyboard.instantiateInitialViewController() as! UINavigationController
        nav.willMove(toParent: self)
        addChild(nav)
        
        if let rootViewController = self.rootViewController {
            self.rootViewController = nav
            rootViewController.willMove(toParent: nil)
            
            transition(from: rootViewController, to: nav, duration: 0.55, options: [.transitionCrossDissolve, .curveEaseOut], animations: { () -> Void in
                
            }, completion: { _ in
                nav.didMove(toParent: self)
                rootViewController.removeFromParent()
                rootViewController.didMove(toParent: nil)
            })
        } else {
            rootViewController = nav
            view.addSubview(nav.view)
            nav.didMove(toParent: self)
        }
    }
    
    
    override var prefersStatusBarHidden : Bool {
        switch rootViewController  {
        case is SplashViewController:
            return true
        case is MenuNavigationViewController:
            return false
        default:
            return false
        }
    }
}
