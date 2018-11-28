//
//  WorkViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class WorkViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var workTableView: UITableView!
    var workViewModel : WorkViewModel!{
        didSet{
            
            self.workTableView.delegate = self
            self.workTableView.dataSource = self
            self.workTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.workTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkData()
        
    }
    func getWorkData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getWork, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.workViewModel = WorkViewModel.init(response)
            }
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        if let work = self.workViewModel?.getWork(row: indexPath.row)
        {
            let name = work.0
            eductionTableViewCell.educationNameLBL.text = name
            let description = work.1
            eductionTableViewCell.educationDescriptionLBL.text = description
            let period = work.2
            eductionTableViewCell.educationDurationLBL.text = period
        }
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = self.workViewModel?.count
        {
            return count
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 65
    //    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
