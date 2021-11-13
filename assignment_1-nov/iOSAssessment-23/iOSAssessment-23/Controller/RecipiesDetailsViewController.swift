//
//  RecipiesDetailsViewController.swift
//  iOSAssessment-23
//
//  Created by Mohammad Talha on 08/11/21.
//

import UIKit
import CoreData

class RecipiesDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var dateTf: UITextField!
    @IBOutlet weak var ingrediantesTf: UITextField!
    @IBOutlet weak var createdByTf: UITextField!
    @IBOutlet weak var timeToPrepareTf: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    
    //MARK: - Methods

    func createData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let RecipeEntity = NSEntityDescription.entity(forEntityName: "Recipe", in: managedContext)!
        
        let recipe = NSManagedObject(entity: RecipeEntity, insertInto: managedContext)
        recipe.setValue(nameTf.text, forKey: "name")
        recipe.setValue(dateTf.text, forKey: "date")
        recipe.setValue(ingrediantesTf.text, forKey: "ingredients")
        recipe.setValue(createdByTf.text, forKey: "createdBy")
        recipe.setValue(timeToPrepareTf.text, forKey: "timeToPrepare")
        
        do {
            try managedContext.save()
        } catch let err as NSError {
            print("Could not save. \(err). \(err.userInfo)")
        }
        
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

    func updateData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Recipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", "RejmaAndChawal")
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("newName", forKey: "name")
            objectUpdate.setValue("newDate", forKey: "date")
            objectUpdate.setValue("newIngredients", forKey: "ingredients")
            objectUpdate.setValue("newCreatedBy", forKey: "createdBy")
            
            do {
                try managedContext.save()
            }
            catch {
                print(error)
            }
        }
        
        catch {
            print(error)
        }
    }
    
    func deleteData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Recipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", "RejmaAndChawal")
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }

    }
}
