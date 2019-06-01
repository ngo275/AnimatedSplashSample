//
//  Utils.swift
//  SplashDemo
//
//  Created by ShuichiNagao on 2019/06/01.
//  Copyright © 2019 Shuichi Nagao. All rights reserved.
//

import UIKit

//*****************************************************************
// MARK: - Extensions
//*****************************************************************

public extension UIColor {
    class func fuberBlue()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 15/255, green: 78/255, blue: 101/255, alpha: 1)
        }
        return C.c
    }
    
    class func fuberLightBlue()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 77/255, green: 181/255, blue: 217/255, alpha: 1)
        }
        return C.c
    }
}

//*****************************************************************
// MARK: - Helper Functions
//*****************************************************************

public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
