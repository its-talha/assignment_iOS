//
//  ViewController.swift
//  FrameworksDemo
//
//  Created by Mohammad Talha on 07/11/21.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    let eventStore = EKEventStore()
    var time = Date()
    var date: String = ""
    var startTime: String = ""
    @IBOutlet weak var evNameTF: UITextField!
    @IBOutlet weak var dateData: UIDatePicker!
    @IBOutlet weak var evHoursTF: UITextField!
    @IBOutlet weak var evDescTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let eventStore = EKEventStore()
        
    }
    
    func checkAuthorization(){
        // authorizaion status basically returns the authorization status
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore)
            case .denied:
                print("Access denied")
            case .notDetermined:
            // In case of not determined
                eventStore.requestAccess(to: .event, completion:
                  {[weak self] (granted: Bool, error: Error?) -> Void in
                      if granted {
                        self!.insertEvent(store: self!.eventStore)
                      } else {
                            print("Access denied")
                      }
                })
                default:
                    print("Case default")
        }
    }
    
    func insertEvent(store: EKEventStore) {
        let event:EKEvent = EKEvent(eventStore: store)
        let startDate = dateData.date
        print(startDate)
        let hours = Double(evHoursTF.text ?? "1")!
        let endDate = startDate.addingTimeInterval(hours * 60 * 60)
        event.title = evNameTF.text
        event.startDate = startDate
        event.endDate = endDate
        event.notes = evDescTF.text
        event.calendar = store.defaultCalendarForNewEvents
        do {
            try store.save(event, span: .thisEvent)
            } catch let error as NSError {
        print("failed to save event with error : \(error)")
        }
        print("Saved Event")
    }

    @IBAction func dataPicker(_ sender: UIDatePicker) {
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
        checkAuthorization()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.navigationController?.pushViewController(vc,animated: true)
    }
}

