//
//  MaTabBar.swift
//  Codata
//
//  Created by Gilles ROBERT on 12/08/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit

class MaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
        //changer le fond de la tabBar
        //tabBar.barTintColor = .yellow

        //tabBar Transparente
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()

    }
    

    

}
