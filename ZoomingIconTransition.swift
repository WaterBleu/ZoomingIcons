//
//  ZoomingIconTransition.swift
//  ZoomingIcons
//
//  Created by Jeff Huang on 2015-08-06.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

class ZoomingIconTransition: NSObject, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate {
   let kZoomingIconTransitionDuration = 1 as NSTimeInterval
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return kZoomingIconTransitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let timeInterval = transitionDuration(transitionContext)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var containerView = transitionContext.containerView()
        
        containerView.insertSubview(toViewController!.view, aboveSubview: fromViewController!.view)
        toViewController!.view.alpha = 0
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            toViewController!.view.alpha = 1
        }) { (success) -> Void in
            transitionContext.completeTransition(true)
        }
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

}
