//
//  SplashViewController.swift
//  SplashDemo
//
//  Created by ShuichiNagao on 2019/06/01.
//  Copyright © 2019 Shuichi Nagao. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    var pulsing = false
    
    let animatedULogoView = AnimatedULogoView(frame: CGRect(x: 0.0, y: 0.0, width: 90.0, height: 90.0))
    var tileGridView: TileGridView!
    
    init(tileViewFileName: String) {
        super.init(nibName: nil, bundle: nil)
        tileGridView = TileGridView(TileFileName: tileViewFileName)
        view.addSubview(tileGridView)
        tileGridView.frame = view.bounds
        
        view.addSubview(animatedULogoView)
        animatedULogoView.layer.position = view.layer.position
        
        tileGridView.startAnimating()
        animatedULogoView.startAnimating()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

