//
//  ViewController.swift
//  NotificationUpdate
//
//  Created by DitoShabri on 24/06/21.
//
import UserNotifications
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (_, _) in
            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                self.scheduleNotification()

           }
        }
    }

    
    func scheduleNotification(){
        
        //Content
        
        let content = UNMutableNotificationContent()
        content.title = "Dito Shabri Akui nangis nonton Drakor"
        content.body = "Go and connect with Dito Shabri is video"
        
        
        //Triger
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        
        //Request
        
        let request = UNNotificationRequest(identifier: "time_sensitive_exemple",
                                            content: content,
                                            trigger: trigger)
        
        //Scedule request
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error  {
                print(error)
            } else {
                print("Suscess!")
            }
        }
        
        
    }
}

