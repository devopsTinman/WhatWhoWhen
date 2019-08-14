//
//  ProjectsVC.swift
//  WhatWhoWhen
//
//  Created by Allbee, Eamon on 8/13/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class ProjectsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var projectList: UITableView!
    
    var allProjects = [WWWProject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return DataService.instance.getProjectList().count
        return allProjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell") as? ProjectCell {
            //let projectItem = DataService.instance.getProjectList()[indexPath.row]
            let projectItem = allProjects[indexPath.row]
            cell.updateViews(wwwProject: projectItem)
            return cell
        }
        else {
            return ProjectCell()
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            DataService.instance.deleteProject(deleteProject: self.allProjects[indexPath.row])
            self.allProjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
        
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectList.dataSource = self
        projectList.delegate = self
        
        allProjects = DataService.instance.getAllProjects()
        
    }
    
    @IBAction func doneProjectAdd(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBAction func cancelProjectAdd(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}
