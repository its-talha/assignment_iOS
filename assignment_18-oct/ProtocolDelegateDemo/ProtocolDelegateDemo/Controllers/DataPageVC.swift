//
//  DataPageVC.swift
//  ProtocolDelegateDemo
//
//  Created by Mohammad Talha on 31/10/21.
//

import UIKit

protocol DataPageDelegate {
    func saveData(profile: Profile)
}

class DataPageVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var pNameTF: UITextField!
    
    var delegate: DataPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneSavingData(_ sender: UIButton) {
        let data = getData()
        delegate?.saveData(profile: data)
        navigationController?.popViewController(animated: true)
    }
    
    func getData() -> Profile{
        
        let profile = Profile(name: String(nameTF.text ?? ""), age: String(ageTF.text ?? ""), pName: String(pNameTF.text ?? ""))
        
        return profile
    }
}
