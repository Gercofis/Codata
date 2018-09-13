//
//  ListeCell.swift
//  Codata
//
//  Created by Gilles ROBERT on 13/08/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit

class ListeCell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var dateLBL: UILabel!

    var liste: Liste!

    func setupCell(liste: Liste){
        self.liste = liste
        nameLBL.text = self.liste.nom
    }

}
