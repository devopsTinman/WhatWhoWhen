//
//  WhereToVC.swift
//  WhatWhoWhen
//
//  Created by Allbee, Eamon on 8/13/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class WhereToVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var whereToTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getWhereToList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "whereToCell") as? WhereToCell {
            let whereTo = DataService.instance.getWhereToList()[indexPath.row]
            cell.updateViews(whereTo: whereTo)
            return cell
        }
        else {
            return WhereToCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let whereTo = DataService.instance.getWhereToList()[indexPath.row]
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "toPeopleVC", sender: whereTo)
        case 1:
            performSegue(withIdentifier: "toOverdueVC", sender: whereTo)
        case 2:
            performSegue(withIdentifier: "toProjectsVC", sender: whereTo)
        case 3:
            performSegue(withIdentifier: "toUpcomingVC", sender: whereTo)
        case 4:
            performSegue(withIdentifier: "toWWWListVC", sender: whereTo)
        default:
            performSegue(withIdentifier: "toProjectsVC", sender: whereTo)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whereToTable.dataSource = self
        whereToTable.delegate = self
    }
    
    
    
}

