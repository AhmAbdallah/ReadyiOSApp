//
//  SkillsViewController.swift
//  Ahmed Abdallah
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 4a5. All rights reserved.
//

import UIKit

class SkillsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var skillsTableView: UITableView!
    var skillsViewModel : SkillsViewModel!{
        didSet{
            
            self.skillsTableView.delegate = self
            self.skillsTableView.dataSource = self
            self.skillsTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
            self.skillsTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getSkillsData()
    }
    func getSkillsData()
    {
        self.startAnimating()
        ServiceConnector.shared.connect(.getSkills, success: { (target, response) in
            print(response)
            self.stopAnimating()
            if (response["status"]).int == 200
            {
                self.skillsViewModel = SkillsViewModel.init(response)
            }
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        if let skill = self.skillsViewModel?.getSkill(row: indexPath.row)
        {
            let name = skill.0
            eductionTableViewCell.educationNameLBL.text = name
            let description = skill.1
            eductionTableViewCell.educationDescriptionLBL.text = description
            let period = skill.2
            eductionTableViewCell.educationDurationLBL.text = period
        }
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = self.skillsViewModel?.count
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
