//
//  SecondVC.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 21/10/21.
//

import UIKit

class SecondVC: UIViewController {
    
    var imageId : String = ""
    var author_url : String = ""

    @IBOutlet weak var authorBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var downBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        
        authorBtn.layer.cornerRadius = authorBtn.layer.frame.height / 2
        downBtn.layer.cornerRadius = downBtn.layer.frame.height / 2
        
        let link = defaultLink + imageId
        imageView.downloaded(from: link)
        imageView.contentMode = .scaleToFill
        
        
    }
    
    func setUpNavBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor.gray
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Gallery App"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "power"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.topItem?.title = ""
    
    }
    
    @IBAction func openUrl(_ sender: UIButton) {
        if let url = URL(string: author_url){
            UIApplication.shared.open(url)
        }
    }
}
