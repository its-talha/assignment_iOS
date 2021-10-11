//
//  HomeVC.swift
//  NestedControllers_Demo
//
//  Created by Mohammad Talha on 06/10/21.
//

import UIKit

let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
let newStoryBoard = UIStoryboard.init(name: "New", bundle: nil)

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    
    // setting NavBar
    private func setupNavBar(){
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 4.0
        navigationController?.navigationBar.layer.shadowOpacity = 1.0
        navigationController?.navigationBar.layer.masksToBounds = false
    }
    
}



//MARK: IBActions

extension HomeVC {
    
    @IBAction func goToPageControl(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToViewDemo(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "UiViewShadowCornerDemoVC") as? UiViewShadowCornerDemoVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToDifference(_ sender: UIButton) {
        
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "VC1") as? VC1
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToNewStoryBorad(_ sender: UIButton) {
        
        let vc = newStoryBoard.instantiateViewController(withIdentifier: "NewVC") as? NewTabVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToProgramticTabBarController(_ sender: UIButton) {
        let vc = ProgramaticTabVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
