//
//  SplashScreenViewController.swift
//  CareerShowcase
//
//  Created by Ahmed's Mac on 24/10/18.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import UIKit

class SplashScreenViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        //let homeNavigationController =  self.storyboard?.instantiateViewController(withIdentifier: "BaseNavigationController") as! BaseNavigationController
        let baseTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "BaseTabBarController") as! BaseTabBarController
        self.present(baseTabBarController, animated: true, completion: nil)
        //homeNavigationController.viewControllers = [changeLanguageViewController]
//        self.present(changeLanguageViewController, animated: true, completion: nil)
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
