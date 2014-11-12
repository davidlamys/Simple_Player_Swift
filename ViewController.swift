//
//  ViewController.swift
//  Simple_Player_Swift
//
//  Created by Olga Dalton on 26/08/14.
//  Copyright (c) 2014 swiftiostutorials.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func forcePortrait(){
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let isLandscape = width > height
        if isLandscape{
            var device = UIDevice.currentDevice()
            let number = NSNumber(integer: UIInterfaceOrientation.Portrait.rawValue)
            device.setValue(number, forKey: "orientation")
        }
    }
    
    func forceLandScape(){
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let isLandscape = width < height
        if isLandscape{
            var device = UIDevice.currentDevice()
            let number = NSNumber(integer: UIInterfaceOrientation.LandscapeRight.rawValue)
            device.setValue(number, forKey: "orientation")
        }
    }
}

extension ViewController : UINavigationControllerDelegate{
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        
        if viewController is SecondViewController{
            self.forceLandScape()
        }
        if viewController is ViewController
        {
            //apply the Force only after UI has updated
            dispatch_async(dispatch_get_main_queue(), {
                self.forcePortrait()

            })
        }
    }
}

