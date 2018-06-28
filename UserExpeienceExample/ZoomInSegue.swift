//
//  ZoomInSegue.swift
//  UserExpeienceExample
//
//  Created by Michael Budd on 6/28/18.
//  Copyright © 2018 Michael Budd. All rights reserved.
//

import UIKit

class ZoomInSegue: UIStoryboardSegue {
    
    override func perform() {
        zoomInToDestination()
    }
    
    func zoomInToDestination() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let originCenter = fromViewController.view.center
        let containerView = fromViewController.view.superview
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 1, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }) { (success) in
            fromViewController.present(toViewController, animated: false, completion: nil)
        }
        
    }

}
