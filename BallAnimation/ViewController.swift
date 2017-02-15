//
//  ViewController.swift
//  BallAnimation
//
//  Created by Jimmy Hoang on 2/15/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    let ball = CAShapeLayer()
    
//    var moveRightAnimation: CABasicAnimation!
//    var moveLeftAnimation: CABasicAnimation!
//    var moveUpAnimation: CABasicAnimation!
//    var moveDownAnimation: CABasicAnimation!
//    var moveDownToRightAnimation: CABasicAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100)).cgPath
        ball.fillColor = UIColor.black.cgColor
        ball.position = CGPoint(x: self.view.frame.width - 100, y: self.view.frame.midY - 50)
        ball.rasterizationScale = UIScreen.main.scale
        ball.shouldRasterize = true
        self.view.layer.addSublayer(ball)
        
        addMoveUp()
        addMoveLeft()
        addMoveDown()
        addMoveDownToRight()
    }
    
    func addMoveUp() {
        let moveUpAnimation = CABasicAnimation(keyPath: "position")
        moveUpAnimation.beginTime = CACurrentMediaTime()
        //        moveUpAnimation.repeatDuration = CACurrentMediaTime() + 7.5
        //        moveUpAnimation.repeatCount = Float.infinity
        moveUpAnimation.setValue("up", forKey: "upKey")
        moveUpAnimation.delegate = self
        moveUpAnimation.fromValue = CGPoint(x: self.view.frame.width - 100, y: self.view.frame.midY - 50)
        moveUpAnimation.toValue = CGPoint(x: self.view.frame.midX - 50, y: 0)
        moveUpAnimation.duration = 1.5
        moveUpAnimation.fillMode = kCAFillModeForwards
        moveUpAnimation.isRemovedOnCompletion = false
        moveUpAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        ball.add(moveUpAnimation, forKey: "moveUpAnimation")
    }
    
    func addMoveLeft() {
        let moveLeftAnimation = CABasicAnimation(keyPath: "position")
        moveLeftAnimation.beginTime = CACurrentMediaTime() + 1.5
        //        moveLeftAnimation.repeatDuration = CACurrentMediaTime() + 9.0
        //        moveLeftAnimation.repeatCount = Float.infinity
        moveLeftAnimation.setValue("left", forKey: "leftAnimation")
        moveLeftAnimation.delegate = self
        moveLeftAnimation.fromValue = CGPoint(x: self.view.frame.midX - 50, y: 0)
        moveLeftAnimation.toValue = CGPoint(x: 0, y: self.view.frame.midY - 50)
        moveLeftAnimation.duration = 1.5
        moveLeftAnimation.fillMode = kCAFillModeForwards
        moveLeftAnimation.isRemovedOnCompletion = false
        moveLeftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        ball.add(moveLeftAnimation, forKey: "moveLeftAnimation")
    }
    
    func addMoveDown() {
        let moveDownAnimation = CABasicAnimation(keyPath: "position")
        moveDownAnimation.beginTime = CACurrentMediaTime() + 3.0
        //        moveDownAnimation.repeatDuration = CACurrentMediaTime() + 10.5
        //        moveDownAnimation.repeatCount = Float.infinity
        moveDownAnimation.setValue("down", forKey: "downKey")
        moveDownAnimation.delegate = self
        moveDownAnimation.fromValue = CGPoint(x: 0, y: self.view.frame.midY - 50)
        moveDownAnimation.toValue = CGPoint(x: self.view.frame.midX - 50, y: self.view.frame.height - 100)
        moveDownAnimation.duration = 1.5
        moveDownAnimation.fillMode = kCAFillModeForwards
        moveDownAnimation.isRemovedOnCompletion = false
        moveDownAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        ball.add(moveDownAnimation, forKey: "moveDownAnimation")
    }
    
    func addMoveDownToRight() {
        let moveDownToRightAnimation = CABasicAnimation(keyPath: "position")
        moveDownToRightAnimation.beginTime = CACurrentMediaTime() + 4.5
        moveDownToRightAnimation.delegate = self
        //        moveDownToRightAnimation.repeatDuration = CACurrentMediaTime() + 12.0
        //        moveDownToRightAnimation.repeatCount = Float.infinity
        moveDownToRightAnimation.setValue("downToRight", forKey: "downToRightKey")
        moveDownToRightAnimation.fromValue = CGPoint(x: self.view.frame.midX - 50, y: self.view.frame.height - 100)
        moveDownToRightAnimation.toValue = CGPoint(x: self.view.frame.width - 100, y: self.view.frame.midY - 50)
        moveDownToRightAnimation.duration = 1.5
        moveDownToRightAnimation.fillMode = kCAFillModeForwards
        moveDownToRightAnimation.isRemovedOnCompletion = false
        moveDownToRightAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        ball.add(moveDownToRightAnimation, forKey: "moveDownToRightAnimation")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
                if let animationID = anim.value(forKey: "downToRightKey") {
                    if animationID as! String == "downToRight" {

//                        ball.removeAnimation(forKey: "moveUpAnimation")
//                        ball.removeAnimation(forKey: "moveLeftAnimation")
//                        ball.removeAnimation(forKey: "moveDownAnimation")
//                        ball.removeAllAnimations()
                        addMoveUp()
                        addMoveLeft()
                        addMoveDown()
                        addMoveDownToRight()
                    }
        
                }
    }
    
}

