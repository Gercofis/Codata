//
//  CoreDataHelper.swift
//  Codata
//
//  Created by Gilles ROBERT on 12/08/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit
import CoreData

typealias ListeCompletion = (_ listes: [Liste]?) -> Void

class CoreDataHelper {
    //Récupérer base CoreData
    private let appDel = UIApplication.shared.delegate as! AppDelegate

    //Récupérer le contexte
    var context: NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }

    //MARK: Sauvegarder dans CoreData
    func save() {
        appDel.saveContext()
    }
    func saveArticle(nom: String?, shop: String?, prix: String?, image: UIImage?, liste: Liste) {
        let new = Article(context: context)
        new.date = Date()
        new.nom = nom
        new.shop = shop
        new.image = image
        if let str = prix, let double = Double(str){
            new.prix = double
        }
        new.liste = liste
        save()
    }

    func deleteListe(_ liste: Liste){
        if let articles = liste.article?.allObjects as?[Article] {
            for article in articles {
                context.delete(article)
            }
        }
        context.delete(liste)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }


    func deleteArticle(_ article: Article) {
        context.delete(article)
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name("delete"), object: nil)
        } catch  {
            print(error.localizedDescription)
        }
    }

    //MARK: Logique Entity Liste /////
    func saveListe(_ string: String?) {
        guard let texte = string, texte != "" else { return }
        let nouvelleListe = Liste(context: context)
        nouvelleListe.date = Date()
        nouvelleListe.nom = texte
        save()
        print("Sauvegarder !!"+(texte))
    }

    func getListe(completion: ListeCompletion?)  {
        let fetchRequest: NSFetchRequest<Liste> = Liste.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let listes = try context.fetch(fetchRequest)
//            for l in listes {
//                let leNom :String? = l.nom ?? "pas de nom"
//                print(leNom)
//
//            }
            completion?(listes)

        } catch {
            completion?(nil)
            print(error.localizedDescription)
        }
    }
//    func deleteListe(_ liste: Liste) {
//
}

