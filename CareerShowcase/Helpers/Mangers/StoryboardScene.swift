//
//  StoryboardScene.swift
//  MyFatoorah
//
//  Created by Ahmed Abdallah on 1/26/18.
//  Copyright © 2018 Ahmed Abdallah. All rights reserved.
//

import Foundation
import UIKit

// this to mange all screen it helpful when you have more than one storyboard
//
protocol StoryboardSceneType {
    static var storyboardName: String { get }
}

extension StoryboardSceneType {
    /// load storyboard by it's name
    ///
    /// - Returns: storyboarf loaded
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    
    /// load storyboard first Controller
    static func initialViewController() -> UIViewController {
        guard let vc = storyboard().instantiateInitialViewController() else {
            fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
        }
        return vc
    }
    /// load view Controller with idebtifier
    ///
    /// - Parameter withIdentifier: Controller identifier
    /// - Returns: Controller
    static func viewController(withIdentifier:String) -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier:withIdentifier)
    }
}

/// enum contain refrence of all screens on the app


