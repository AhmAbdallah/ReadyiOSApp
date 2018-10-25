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
        loadWebviewContent()
    }
    func getOverviewData()
    {
        //I prefered Moya more thank Alamofire, but I had an error in the configraution file and it consumed long time so I used this hard solution
        ServiceConnector.shared.connect(.getOverview, success: { (target, response) in
            print(response)
            self.overviewModel = OverviewModel.overViewFrom(json: response)
        })
    }
    func loadWebviewContent()
    {
        
        let htmlString = "Experienced iOS Developer with a demonstrated history of working in the computer software industry. Strong engineering professional with a Bachelor's degree focused in Computer Science from Assiut University."
        overviewWebview.loadHTMLString(htmlString, baseURL: nil)
        
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
