//
//  OverviewViewModel.swift
//  CareerShowcase
//
//  Created by Ahmed Abdallah on 28.11.2018.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class OverviewViewModel {
    
    private var overviewModel : OverviewModel?
    var overviewUserImageView: UIImageView!
    var overviewWebview: UIWebView!
    var imageURL: URL!
    var overViewHTMLString: String!
    
    init(_ response: JSON) {
        
        overviewModel = OverviewModel.init(fromJson: response["data"])
        
        if let image = overviewModel!.imageUrl {
            
            imageURL = URL(string: image)!
            
        }
        if let overViewHTMLString = overviewModel!.overView
        {
            self.overViewHTMLString = overViewHTMLString
            
        }
        
        
    }
}
