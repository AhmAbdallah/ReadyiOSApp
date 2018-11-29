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
    var educationViewModel : [EducationViewModel]!{
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
                self.educationViewModel = EducationViewModel.addEducation(json: response)
                
            }
        })
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        let eduction = self.educationViewModel?[indexPath.row]
        eductionTableViewCell.educationViewModel = eduction
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.educationViewModel?.count
        return count!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }  
}
