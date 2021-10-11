//
//  ProgramaticTabVC.swift
//  NestedControllers_Demo
//
//  Created by Mohammad Talha on 06/10/21.
//

import UIKit

class ProgramaticTabVC: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        self.title = "Manual TabBar"
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let item1 = ItemOneVC()
        let barItem1 = UITabBarItem(title: "Smile", image: UIImage(systemName: "face.smiling"), selectedImage: UIImage(systemName: "face.smiling.fill"))
        item1.tabBarItem = barItem1
        
        let item2 = ItemTwoVC()
        let barItem2 = UITabBarItem(title: "Face", image: UIImage(systemName: "face.dashed"), selectedImage: UIImage(systemName: "face.dashed.fill"))
        item2.tabBarItem = barItem2
        
        let controllers = [item1, item2]
        self.viewControllers = controllers
        
    }
}
