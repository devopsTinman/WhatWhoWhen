//
//  PeopleVC.swift
//  WhatWhoWhen
//
//  Created by Allbee, Eamon on 8/13/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class PeopleVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var peopleList: UITableView!
    
    var allPeople = [Who]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonCell {
            //let projectItem = DataService.instance.getProjectList()[indexPath.row]
            let personItem = allPeople[indexPath.row]
            cell.updateViews(person: personItem)
            return cell
        }
        else {
            return PersonCell()
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            DataService.instance.deletePerson(user: self.allPeople[indexPath.row])
            self.allPeople.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
        
    }
    
    
    @IBAction func startBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleList.dataSource = self
        peopleList.delegate = self
        
        allPeople = DataService.instance.getAllUsers()
    }
    
    @IBAction func donePersonAdd(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBAction func cancelPersonAdd(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    
}
