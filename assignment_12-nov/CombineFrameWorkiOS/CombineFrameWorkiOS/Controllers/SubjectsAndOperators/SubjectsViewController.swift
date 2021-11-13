//
//  SubjectsViewController.swift
//  CombineFrameWorkiOS
//
//  Created by Mohammad Talha on 12/11/21.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriberSecond: Subscriber {
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Recieved Value by subscriber1 \(input)")
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
    
    
    typealias Input = String
    typealias Failure = MyError
    
}


class SubjectsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Subjects
           // - Publisher
           // - Subscribers
        let subscriber1 = StringSubscriberSecond()
        let subject = CurrentValueSubject<String, MyError>("Hello User")
        subject.subscribe(subscriber1)
        
        let subscriber2 = subject.sink { _ in
        } receiveValue: { input in
            print("Recieved Value by subscriber2 \(input)")
        }
        
        let subscriber3 = subject.sink { _ in
        } receiveValue: { input in
            print("Recieved Value by subscriber3 \(input)")
        }
        subject.send("A")
        subject.send("B")
        subscriber2.cancel()
        subject.send("C")
        subject.send("D")
        
    }
 
}
