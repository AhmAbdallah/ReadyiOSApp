//
//  Application.swift
//  Sample
//
//  Created by Ahmed Abdallah on 3/3/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit
import Foundation

class Application: UIApplication
{
    override func sendEvent(_ event: UIEvent)
    {
        super.sendEvent(event)
    }
    override internal var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection
        {
        get
        {
            if(Language.currentAppleLanguage() == "ar" || Language.currentAppleLanguage()  == "he")
            {
              // UIView.appearance().semanticContentAttribute = .ForceRightToLeft

                return UIUserInterfaceLayoutDirection.rightToLeft;
            }
           // UIView.appearance().semanticContentAttribute = .ForceLeftToRight
            return UIUserInterfaceLayoutDirection.leftToRight;
        }
    }
}
