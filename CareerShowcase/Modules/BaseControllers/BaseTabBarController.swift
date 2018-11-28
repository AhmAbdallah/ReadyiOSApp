//
//  BaseTabBarController.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    var workButton: UIButton!
    var shapeLayer: CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMiddleButton()
    }
    
    func setupMiddleButton()
    {
        self.workButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        var workButtonFrame = workButton.frame
        //You can editing position of button by inc or dec 10.
        workButtonFrame.origin.y = self.tabBar.frame.origin.y  - (self.workButton.frame.height / 2)
        workButtonFrame.origin.x = view.bounds.width/2 - workButtonFrame.size.width/2
        workButton.frame = workButtonFrame
        workButton.layer.cornerRadius = workButtonFrame.height/2
        workButton.tag=0
        workButton.setImage(UIImage(named: "ic-Work"), for: .normal)
        workButton.setImage(UIImage(named: "ic-Work"), for: .highlighted)
        workButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        // Draw background semi-circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.workButton.frame.origin.x + (self.workButton.frame.width / 2), y: self.workButton.frame.origin.y + (self.workButton.frame.height / 2)), radius: CGFloat(127), startAngle: CGFloat(0), endAngle:CGFloat(M_PI), clockwise: false)
        
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer.path = circlePath.cgPath
        //you can change the line width
        self.shapeLayer.lineWidth = 0.0
        self.shapeLayer.isHidden = true
        
        view.layer.addSublayer(self.shapeLayer)
        view.addSubview(workButton)
        workButton.layer.zPosition = 1
        //------------------------------
    }
    @objc func menuButtonAction(sender: UIButton)
    {
        self.selectedIndex = 2
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
