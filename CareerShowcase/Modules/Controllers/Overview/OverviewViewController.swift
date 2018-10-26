//
//  OverviewViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit
import Alamofire
class OverviewViewController: BaseViewController {
    @IBOutlet weak var overviewWebview: UIWebView!
    @IBOutlet weak var overviewUserImageView: UIImageView!
    var overviewModel : OverviewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let imageUrl = offersProducts![indexPath.row].iMAGEPATH {
//            let url = URL(string: image)!
//            cell.ProductImageView.af_setImage(withURL: url)
//        }
        // Do any additional setup after loading the view.
        getOverviewData()
    }
    func getOverviewData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getOverview, success: { (target, response) in
            self.stopAnimating()
            if (response["status"]).int == 200
            {
            self.overviewModel = OverviewModel.init(fromJson: response["data"])
                self.updateUIView()
            }
        })
    }
    func updateUIView() {
        if let overView = overviewModel
        {
        if let image = overView.imageUrl {
            let url = URL(string: image)!
            overviewUserImageView.af_setImage(withURL: url)
        }
        if let overViewContent = overView.overView
        {
       
            let htmlString = overViewContent
            overviewWebview.loadHTMLString(htmlString, baseURL: nil)
        }
        }
    }
    
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
