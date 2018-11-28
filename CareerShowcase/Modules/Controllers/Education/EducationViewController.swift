//
//  EducationViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var educationTableView: UITableView!
    var educationViewModel : EducationViewModel!{
        didSet{
            
            self.educationTableView.delegate = self
            self.educationTableView.dataSource = self
            self.educationTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.educationTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEducationData()
        
    }
    func getEducationData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getEducation, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.educationViewModel = EducationViewModel.init(response)
                
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
        if let eduction = self.educationViewModel?.getEducation(row: indexPath.row)
        {
            let name = eduction.0
            eductionTableViewCell.educationNameLBL.text = name
            let description = eduction.1
            eductionTableViewCell.educationDescriptionLBL.text = description
            let period = eduction.2
            eductionTableViewCell.educationDurationLBL.text = period
        }
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = self.educationViewModel?.count
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
