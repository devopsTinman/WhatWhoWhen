//
//  DataService.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class DataService {
    
    static let instance = DataService()
    
    func getWhereToList() -> [WhereTo] {
        let whereToList = [
            WhereTo(title: "People", imageName: "user.png", objectCount: getPeopleCount()),
            WhereTo(title: "Overdue", imageName: "countdown.png", objectCount: 0),
            WhereTo(title: "Projects", imageName: "layers.png", objectCount: getProjectCount()),
            WhereTo(title: "Upcoming", imageName: "calendar-with-a-clock-time-tools.png", objectCount: 0),
            WhereTo(title: "WhatWhoWhen", imageName: "wwwIcon.png", objectCount: getWWWCount())
        ]
        return whereToList
    }
    
    //    private let projectList = [
    //        WWWProject(name: "Basement Remodel", dateDue: Date(), startDate: Date()),
    //        WWWProject(name: "Clubhouse", dateDue: Date(), startDate: Date()),
    //        WWWProject(name: "Dollhouse", dateDue: Date(), startDate: Date())
    //    ]
    //
    //    func getProjectList() -> [WWWProject] {
    //        return projectList
    //    }
    
    //    private let whoList = [
    //        Who(name: "Bob", email: "bob@bob.com", password: "ka-ching", signinType: "email"),
    //        Who(name: "Bill", email: "bill@bob.com", password: "ka-ching", signinType: "email"),
    //        Who(name: "Barry", email: "barry@bob.com", password: "ka-ching", signinType: "email")
    //    ]
    //
    //    func getWhoList() -> [Who] {
    //        return whoList
    //    }
    
    private let whatList = [
        What(name: "Pickup Shoes"),
        What(name: "Eat Breakfast"),
        What(name: "Rock on")
    ]
    
    func getWhatList() -> [What] {
        return whatList
    }
    
    private let whenList = [
        When(dateDue: Date(), pastDue: "N"),
        When(dateDue: Date(), pastDue: "N"),
        When(dateDue: Date(), pastDue: "N")
    ]
    
    func getWhenList() -> [When] {
        return whenList
    }
    //    private(set) public var project: Project
    //    private(set) public var who: Who
    //    private(set) public var what: What
    //    private(set) public var when: When
    
    
    //    func getWWWList() -> [WhatWhoWhen] {
    //        let whatWhoWhenTest = [
    //            WhatWhoWhen(wwwproject: projectList[0], who: whoList[0], what: whatList[0], when: whenList[0]),
    //            WhatWhoWhen(wwwproject: projectList[0], who: whoList[1], what: whatList[1], when: whenList[1]),
    //            WhatWhoWhen(wwwproject: projectList[0], who: whoList[2], what: whatList[2], when: whenList[2])
    //        ]
    //        return whatWhoWhenTest
    //    }
    
    func getPeopleCount() -> Int {
        
        var recordCount = 0
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return recordCount
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<People> = People.fetchRequest()
        recordCount = try! managedContext.count(for: fetchRequest)
        return recordCount
        
    }
    
    func createWWW(newWWW: WhatWhoWhen) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let wwwEntity = NSEntityDescription.entity(forEntityName: "WWWs", in: managedContext)!
        let www = NSManagedObject(entity: wwwEntity, insertInto: managedContext)
        www.setValue(newWWW.who, forKey: "who")
        www.setValue(newWWW.what, forKey: "task")
        www.setValue(newWWW.when, forKey: "dueDate")
        
        do {
            try managedContext.save()
            print("success")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getProjectCount() -> Int {
        
        var recordCount = 0
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return recordCount
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Projects> = Projects.fetchRequest()
        recordCount = try! managedContext.count(for: fetchRequest)
        return recordCount
        
    }
    
    func getWWWCount() -> Int {
        var recordCount = 0
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return recordCount
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<WWWs> = WWWs.fetchRequest()
        recordCount = try! managedContext.count(for: fetchRequest)
        return recordCount
    }
    
    
    func getAllWWW() -> [WhatWhoWhen] {
        var wwwList = [WhatWhoWhen]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return wwwList }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WWWs")
        var currentWWW: WhatWhoWhen
        var project: String = ""
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print("fetching data - result")
            for data in result as! [NSManagedObject] {
                //wwwProject: String, who: String, what: String, when: String
                project = data.value(forKey: "project") as? String ?? ""
                currentWWW = WhatWhoWhen(wwwProject: project, who: data.value(forKey: "who") as! String, what: data.value(forKey: "task") as! String, when: data.value(forKey: "dueDate") as! Date)
                wwwList.append(currentWWW)
            }
        } catch {
            print("Failed to retrieve")
        }
        return wwwList
    }
    
    func getAllProjects() -> [WWWProject] {
        
        var projectList = [WWWProject]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return projectList }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Projects")
        var currentProject: WWWProject
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print("fetching data - result")
            for data in result as! [NSManagedObject] {
                currentProject = WWWProject(name: data.value(forKey: "projectName") as! String, dateDue: data.value(forKey: "endDate") as! Date, startDate: data.value(forKey: "startDate") as! Date)
                projectList.append(currentProject)
            }
        } catch {
            print("Failed to retrieve")
        }
        return projectList
    }
    
    
    
    func getAllUsers() -> [Who] {
        var whoList = [Who]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return whoList }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        var currentPerson: Who
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                currentPerson = Who(name: data.value(forKey: "name") as! String, email: data.value(forKey: "email") as! String, password: data.value(forKey: "password") as! String, signinType: data.value(forKey: "signinType") as! String)
                whoList.append(currentPerson)
            }
        } catch {
            print("Failed to retrieve")
        }
        return whoList
    }
    
    func createUser(user: Who) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "People", in: managedContext)!
        let newUser = NSManagedObject(entity: userEntity, insertInto: managedContext)
        newUser.setValue(user.name, forKey: "name")
        newUser.setValue(user.email, forKey: "email")
        newUser.setValue(user.password, forKey: "password")
        newUser.setValue(user.signinType, forKey: "signinType")
        
        do {
            try managedContext.save()
            print("success")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func deletePerson(user: Who) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        fetchRequest.predicate = NSPredicate(format: "email=%@", user.email)
        
        do {
            
            let test = try managedContext.fetch(fetchRequest)
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
                print("delete success")
            }
            catch
            {
                print(error)
            }
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func deleteProject(deleteProject: WWWProject) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Projects")
        fetchRequest.predicate = NSPredicate(format: "projectName=%@", deleteProject.name)
        
        do {
            
            let test = try managedContext.fetch(fetchRequest)
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
                print("delete success")
            }
            catch
            {
                print(error)
            }
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    func saveProject(newProject: WWWProject) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let projectEntity = NSEntityDescription.entity(forEntityName: "Projects", in: managedContext)!
        let project = NSManagedObject(entity: projectEntity, insertInto: managedContext)
        project.setValue(newProject.name, forKey: "projectName")
        project.setValue(newProject.startDate, forKey: "startDate")
        project.setValue(newProject.dateDue, forKey: "endDate")
        
        do {
            try managedContext.save()
            print("success")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

