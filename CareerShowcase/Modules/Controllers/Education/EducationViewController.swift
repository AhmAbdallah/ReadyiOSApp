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
    var selectedCell = 0
    var eductionArray = ["Assiut University", "Hagaza secondary school"]
    var eductionDetailsArray = ["Bachelor's degree Field Of StudyComputer Science", "Excellent Field Of StudyMathematics Grade91%"]
    var eductionTime = ["2008 – 2012", "2005 – 2008"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.educationTableView.delegate = self
        self.educationTableView.dataSource = self
        self.educationTableView.register(UINib(nibName: "EductionTableViewCell", bundle: nil), forCellReuseIdentifier: "EductionTableViewCell")
        self.educationTableView.register(UINib(nibName: "EducationDetailsTableView", bundle: nil), forCellReuseIdentifier: "EductionDetailsTableViewCell")
        

    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eductionTableViewCell: EductionTableViewCell
        if indexPath.row == selectedCell
        {
            eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionDetailsTableViewCell", for: indexPath) as! EductionTableViewCell
            eductionTableViewCell.educationTitle.text = eductionArray[indexPath.row]
            eductionTableViewCell.educationDetails.text = eductionArray[indexPath.row]
            educationTableView.rowHeight = 214
        }
        else
        {
            eductionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EductionTableViewCell", for: indexPath) as! EductionTableViewCell
            eductionTableViewCell.educationTitle.text = eductionArray[indexPath.row]
            educationTableView.rowHeight = 59
            
        }
        eductionTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return eductionTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCell = indexPath.row
        educationTableView.reloadData()
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
