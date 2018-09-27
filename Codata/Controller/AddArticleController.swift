//
//  AddArticleController.swift
//  Codata
//
//  Created by Gilles ROBERT on 05/09/2018.
//  Copyright © 2018 Gilles ROBERT. All rights reserved.
//

import UIKit


class AddArticleController: UIViewController {

    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var shopTF: UITextField!
    @IBOutlet weak var prixTF: UITextField!
    @IBOutlet weak var imageView: UIImageView!


    var liste: Liste!
    var picker = UIImagePickerController()
    // var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false

    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if let articles = liste.article?.allObjects as? [Article]{
//            self.articles = articles
//            for article in articles {
//                print("L'article ",article.nom)
//            }
//        }
//
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add", let controller = segue.destination as? AddArticleController{
            controller.liste = liste
        }
    }

    @IBAction func addArticleAction(_ sender: Any){
        //liste = [Liste]()
        view.endEditing(true)
        CoreDataHelper().saveArticle(nom: nomTF.text, shop:shopTF.text, prix: prixTF.text, image: imageView.image, liste: liste)
        navigationController?.popViewController(animated: true)
    }

@IBAction func camera(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
    }
}


@IBAction func pictureGallery(_ sender: Any) {
    picker.sourceType = .photoLibrary
    present(picker, animated: true, completion: nil)
}

}


    extension AddArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let or = info[.originalImage] as? UIImage {
                DispatchQueue.main.async {
                    self.imageView.image = or
                }
            }
            dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
}


