//
//  BaseNavigationController.swift
//  CareerShowcase
//
//  Created by Ahmed's Mac on 24/10/18.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import UIKit
    
class BaseNavigationController: UINavigationController {
        
        
       //
        
        override func viewDidLoad() {
         super.viewDidLoad()
         self.navigationBar.setBackgroundImage(UIImage(), for: .default)
         self.navigationBar.shadowImage = UIImage()
         self.navigationBar.isTranslucent = true
//            
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
    
    extension UIViewController {
        func showNavigationLogo() {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "navLogo"))
        }
        
        func alert(title: String = "اميال", message: String? = nil, completion: ((UIAlertAction) -> Void)? = nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "تم", style: .default, handler: completion))
            self.present(alert, animated: true, completion: nil)
        }
        
        func alert(title: String, message: String?, done: @escaping () -> ()) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "لا", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (action) in
                done()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        func alert(title: String, message: String?, done2: @escaping () -> ()) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (action) in
                done2()
            }))
            alert.addAction(UIAlertAction(title: "لا", style: .default, handler: {(action) in
                UserDefaults.standard.set(0, forKey: "APP_COUNT")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        func alert(title: String?, message: String? = nil, cancelTitle: String?, buttons: [String]?, completion: @escaping (_ buttonText: String, _ isCancel: Bool) -> Void) {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            if let cancelTitle = cancelTitle {
                alert.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: { (action) in
                    completion(cancelTitle, true)
                }))
            }
            
            if let buttons = buttons {
                for title in buttons {
                    alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
                        completion(title, false)
                    }))
                }
            }
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        func presentAlert(title: String? = nil, message: String? = nil, buttons: [String]? = nil, actionHandle: ((_ action: UIAlertAction) -> Void)? = nil) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            if let buttons = buttons {
                for button in buttons {
                    let action = UIAlertAction(title: button, style: .default, handler: { (obj) in
                        if let actionHandle = actionHandle {
                            actionHandle(obj)
                        }
                    })
                    
                    alertController.addAction(action)
                }
            } else {
                let action = UIAlertAction(title: "تم", style: .default, handler: { (obj) in
                    if let actionHandle = actionHandle {
                        actionHandle(obj)
                    }
                })
                alertController.addAction(action)
            }
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        func showActionSheet(title: String? = nil,
                             message: String? = nil,
                             actions: [String]?,
                             cancelButtonTitle: String? = nil,
                             completion: ((_ action: UIAlertAction) -> Void)? = nil) {
            
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            if let actions = actions {
                for item in actions {
                    alertController.addAction(UIAlertAction(title: item, style: .default, handler: { (action) in
                        if let completion = completion {
                            completion(action)
                        }
                    }))
                }
            }
            
            if let cancelButtonTitle = cancelButtonTitle {
                alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { (action) in
                    if let completion = completion {
                        completion(action)
                    }
                }))
            }
            
            
            present(alertController, animated: true, completion: nil)
        }
        
}
