//
//  LoadingViewController.swift
//  BartApp
//
//  Created by Josh Jeong on 5/17/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, CAAnimationDelegate {

    var imageView: UIImageView?
    var mask: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage(named: "screen")
        view.addSubview(imageView)
        
        
        self.mask = CALayer()
        self.mask!.contents = UIImage(named: "splash-logo")?.cgImage
        self.mask!.contentsGravity = kCAGravityResizeAspect
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(x: imageView.frame.size.width / 2, y: imageView.frame.size.height / 2)
        imageView.layer.mask = mask
        self.imageView = imageView
        
        animateMask()
        
        view.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        
        UIApplication.shared.isStatusBarHidden = true
        UIApplication.shared.isStatusBarHidden = true
        

    }

    
    func animateMask() {
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(cgRect: mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        keyFrameAnimation.fillMode = kCAFillModeForwards
        keyFrameAnimation.isRemovedOnCompletion = false
        self.mask!.add(keyFrameAnimation, forKey: "bounds")
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        setRootVC()
        imageView!.layer.mask = nil
        
    }


    func setRootVC() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RouteNavigationController") as! UINavigationController
        present(vc, animated: false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
