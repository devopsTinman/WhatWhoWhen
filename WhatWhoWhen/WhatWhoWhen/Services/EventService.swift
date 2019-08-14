//
//  EventManagementService.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 7/19/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
import EventKit
class EventService {
    static let instance = EventService()
    
    let appleEventStore = EKEventStore()
    var calendars: [EKCalendar]?
    func generateEvent(title: String, startDate: Date, endDate: Date, notes: String) {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status)
        {
        case EKAuthorizationStatus.notDetermined:
            // This happens on first-run
            requestAccessToCalendar(title: title, startDate: startDate, endDate: endDate, notes: notes)
        case EKAuthorizationStatus.authorized:
            // User has access
            print("User has access to calendar")
            self.addAppleEvents(title: title, startDate: startDate, endDate: endDate, notes: notes)
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            // We need to help them give us permission
            noPermission()
        }
    }
    func noPermission()
    {
        print("User has to change settings...goto settings to view access")
    }
    func requestAccessToCalendar(title: String, startDate: Date, endDate: Date, notes: String) {
        appleEventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                DispatchQueue.main.async {
                    print("User has access to calendar")
                    self.addAppleEvents(title: title, startDate: startDate, endDate: endDate, notes: notes)
                }
            } else {
                DispatchQueue.main.async{
                    self.noPermission()
                }
            }
        })
    }
    
    func addAppleEvents(title: String, startDate: Date, endDate: Date, notes: String)
    {
        let event:EKEvent = EKEvent(eventStore: appleEventStore)
        event.title = title
        event.startDate = startDate as Date
        event.endDate = endDate as Date
        event.notes = notes
        event.calendar = appleEventStore.defaultCalendarForNewEvents
        
        do {
            try appleEventStore.save(event, span: .thisEvent)
            print("events added with dates:")
        } catch let e as NSError {
            print(e.description)
            return
        }
        print("Saved Event")
    }
}

