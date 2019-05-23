//
//  ProductTableViewCell.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
import Cosmos

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingsView: CosmosView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBorder()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func addBorder() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 5
    }
    
    func setCellData(withProduct: Product) {
        productNameLabel.text = withProduct.name ?? "ProductName"
        releaseDateLabel.text = String(withProduct.releaseDate ?? 10101)
        descriptionLabel.text = withProduct.productDescription ?? "Product description"
        priceLabel.text = String(withProduct.price?.value ?? 0.0) + (withProduct.price?.currency ?? "EUR")
        ratingsView.rating = withProduct.rating ?? 3
        
        // ToDo: Load product Image
    }
    
    
}
