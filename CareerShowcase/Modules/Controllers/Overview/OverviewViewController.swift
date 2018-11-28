//
//  OverviewViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit
import Kingfisher


class OverviewViewController: BaseViewController {
    @IBOutlet weak var overviewWebview: UIWebView!
    @IBOutlet weak var overviewUserImageView: UIImageView!
    var overviewViewModel : OverviewViewModel!{
        didSet{
            self.overviewUserImageView.kf.setImage(with: self.overviewViewModel!.imageURL)
            self.overviewWebview.loadHTMLString(self.overviewViewModel!.overViewHTMLString, baseURL: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOverviewData()
    }
    
    func getOverviewData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getOverview, success: { (target, response) in
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.overviewViewModel = OverviewViewModel.init(response)
            }
        })
    }
    
}
