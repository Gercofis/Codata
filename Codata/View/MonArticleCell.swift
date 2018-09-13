//
//  MonArticleCell.swift
//  Codata
//
//  Created by Gilles ROBERT on 11/09/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit

class MonArticleCell: UITableViewCell {



    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLBL: UILabel!

    @IBOutlet weak var priceLBL: UILabel!

    @IBOutlet weak var nomLBL: UILabel!

    @IBOutlet weak var shopLBL: UILabel!

    var article: Article!

    func setup(_ article: Article){
        self.article = article
        nomLBL.text = self.article.nom
        if let shop = self.article.shop {
            shopLBL.text = "Magasin: " + shop
        } else {
            shopLBL.text = ""
        }

        if let date = self.article.date {
            dateLBL.text = date.toString()
        }
        priceLBL.text = "Prix: \(self.article.prix) €"
        articleIV.image = self.article.image as? UIImage
    }

    @IBAction func deleteArticle(_ sender: Any) {
        CoreDataHelper().deleteArticle(self.article)
    }



}
