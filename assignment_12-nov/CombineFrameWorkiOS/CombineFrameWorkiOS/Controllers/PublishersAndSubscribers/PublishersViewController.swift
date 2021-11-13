//
//  PublishersAndSubscribersViewController.swift
//  CombineFrameWorkiOS
//
//  Created by Mohammad Talha on 12/11/21.
//

import UIKit
import Combine
import Foundation

class PublishersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification.Name("MyNotification")
        
        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
        
        let subscription = publisher.sink(receiveValue: { _ in
          
            print("Recieved Notification")
        })

        
    
        let observer = NotificationCenter.default.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification recevied!")
        }

        NotificationCenter.default.post(name: notification, object: nil)
        subscription.cancel()
        NotificationCenter.default.removeObserver(observer)

    }
    
}
