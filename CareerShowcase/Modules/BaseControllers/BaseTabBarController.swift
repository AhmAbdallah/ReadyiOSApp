//
//  AbstractTabBarController.swift
//  A3lanyBook
//
//  Created by Ahmed's Mac on 3/20/18.
//  Copyright © 2018 Ahmed Abdallah. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    var menuButton: UIButton!
    var shapeLayer: CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 3
        // Do any additional setup after loading the view.
        //self.setupMiddleButton()
    }
    
    func setupMiddleButton()
    {
        self.menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        var menuButtonFrame = menuButton.frame
        //can edit position of button by inc or dec 10.
        menuButtonFrame.origin.y = self.tabBar.frame.origin.y  - (self.menuButton.frame.height / 2)
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        menuButton.tag=0
        
        menuButton.setImage(UIImage(named: "plusButton"), for: .normal)
        menuButton.setImage(UIImage(named: "plusButton"), for: .highlighted)
        
        //menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        
        
        // Draw background semi-circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.menuButton.frame.origin.x + (self.menuButton.frame.width / 2), y: self.menuButton.frame.origin.y + (self.menuButton.frame.height / 2)), radius: CGFloat(127), startAngle: CGFloat(0), endAngle:CGFloat(M_PI), clockwise: false)
        
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        self.shapeLayer.fillColor = UIColor(red: 102.0/255.0, green: 172.0/255.0, blue: 228.0/255.0, alpha: 1.0).cgColor
        //you can change the stroke color
        //            shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        self.shapeLayer.lineWidth = 0.0
        self.shapeLayer.isHidden = true
        
        view.layer.addSublayer(self.shapeLayer)
        view.addSubview(menuButton)
        //Solve button appear issuse when user navigation to note edite view.
        menuButton.layer.zPosition = 1
        //------------------------------
    }
    func menuButtonAction(sender: UIButton)
    {}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
