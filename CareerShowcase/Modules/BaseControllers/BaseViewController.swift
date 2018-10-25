//
//  BaseViewController.swift
//  CareerShowcase
//
//  Created by Ahmed's Mac on 24/10/18.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Whisper

class BaseViewController: UIViewController, NVActivityIndicatorViewable {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
        }else{
            print("Internet Connection not Available!")
            showConnectionReachabilityMessage()
        }
         
          self.navigationController?.view.backgroundColor = .clear
//
//        let statusBarView = UIView(frame: CGRect(x:0, y:0, width:view.frame.size.width, height: UIApplication.shared.statusBarFrame.height))
//        statusBarView.backgroundColor=UIColor.white
//        statusBarView.alpha = 0.0 // set any value between 0 to 1
//        self.view.addSubview(statusBarView)
    }
    
    func showConnectionReachabilityMessage() {
        let message : String!
        let wishperBackgroundColor : UIColor!
        message = "الرجاء الاتصال بالانترنت"
        wishperBackgroundColor = UIColor.red
        let announcement = Announcement(title: "اميال مول", subtitle: message, image: UIImage(named: "avatar"))
        ColorList.Shout.background = wishperBackgroundColor
        ColorList.Shout.title = .white
        ColorList.Shout.subtitle = .white
        Whisper.show(shout: announcement, to: navigationController!, completion: {
            //print("Whisper->completion")
            //Do nothing...
        })
    }
    
    func showProgress() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
    }
    
    func hideProgress() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    
    // MARK: - NavigationBarInfoButton
    
    func navigationBarInfoButton() -> UIButton? {
        guard let informationImage = UIImage(named: "bilgi-icon")?.withRenderingMode(.alwaysTemplate) else {
            return nil
        }
        
        
        let informationButton = UIButton(type: .system)
        informationButton.frame = CGRect.zero
        informationButton.setImage(informationImage, for: .normal)
        //informationButton.addTarget(self, action: #selector(navigateInfoViewController), for: UIControlEvents.touchUpInside)
        informationButton.tintColor = UIColor.white
        informationButton.sizeToFit()
        return informationButton
    }
    
    func navigationInfoBarItem() -> UIBarButtonItem? {
        
        guard let button = navigationBarInfoButton() else {
            return nil
        }
        
        let informationBarButtonItem = UIBarButtonItem(customView: button)
        return informationBarButtonItem
    }
    
    func navigationBarAddInfoButton() {
        guard let informationBarButtonItem = navigationInfoBarItem() else {
            return
        }
        
        self.navigationItem.setRightBarButton(informationBarButtonItem, animated: true)
    }
    
    
}
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,64}?"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    public func isPhone()->Bool {
        if self.isAllDigits() == true {
            //05 325882177
            let phoneRegex = "(05)[0-9]{9}?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        }else {
            return false
        }
    }
    
    private func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
}
class BaseTableViewController: UITableViewController, NVActivityIndicatorViewable {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.view.backgroundColor = .clear
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotatePulse
        //NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = UIView.indicatorViewSize
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
        }else{
            print("Internet Connection not Available!")
            showConnectionReachabilityMessage()
        }
    }
    func showConnectionReachabilityMessage() {
        let message : String!
        let wishperBackgroundColor : UIColor!
        message = "الرجاء الاتصال بالانترنت"
        wishperBackgroundColor = UIColor.red
        let announcement = Announcement(title: "اميال مول", subtitle: message, image: UIImage(named: "avatar"))
        ColorList.Shout.background = wishperBackgroundColor
        ColorList.Shout.title = .white
        ColorList.Shout.subtitle = .white
        Whisper.show(shout: announcement, to: navigationController!, completion: {
            //print("Whisper->completion")
            //Do nothing...
        })
    }
    
    func showProgress() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
    }
    
    func hideProgress() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    
    
}




