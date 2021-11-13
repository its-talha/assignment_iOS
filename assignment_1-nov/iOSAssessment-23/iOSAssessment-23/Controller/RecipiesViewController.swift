//
//  ViewController.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 08/11/21.
//

import UIKit
import CoreData

class RecipiesViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var recipiesTableView: UITableView!

    
    //MARK: - Properties
    var recipiesArray = [Recipies]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetUp()
    }
    
    //MARK: - Actions
    
    
    //MARK: - Methods
    
    private func tableViewSetUp() {
        recipiesTableView.delegate = self
        recipiesTableView.dataSource = self
    }
    
    
    func retrieveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
        }   catch {
            print("Failed")
        }
    }
    
}

//MARK: - UItableView Delegate and Datasource Methods extension
extension RecipiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = recipiesTableView.dequeueReusableCell(withIdentifier: "RecipiesTableViewCell") as? RecipiesTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }

}
