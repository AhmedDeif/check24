//
//  ProductDetailsViewController.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
import Cosmos


class ProductDetailsViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productRatinfsView: CosmosView!
    @IBOutlet weak var productReleaseDate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productShortDescriptionLabel: UILabel!
    @IBOutlet weak var productLongDescriptionLabel: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        if let myProduct = product {
            productPriceLabel.text = String(myProduct.price?.value ?? 0.0) + " " + (myProduct.price?.currency ?? "myProduct")
            productNameLabel.text = myProduct.name ?? "ProductName"
            productReleaseDate.text = String(myProduct.releaseDate ?? 10101)
            productShortDescriptionLabel.text = myProduct.productDescription ?? "Product description"
            productRatinfsView.rating = myProduct.rating ?? 3

            productLongDescriptionLabel.text = myProduct.longDescription ?? "Long description"
            // This image is already cached by alamofire
            NetworkManager.shared().getImage(imageUrl: myProduct.imageURL ?? "") { (error, image) in
                if error != nil {
                    // ToDo: handle image loading error
                }
                else {
                    self.productImageView.image = image!
                }
            }
        }
    }
  
    
    @IBAction func didTapFooter(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
