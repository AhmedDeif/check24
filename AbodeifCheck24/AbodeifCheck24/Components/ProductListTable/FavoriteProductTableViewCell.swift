//
//  FavoriteProductTableViewCell.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
import Cosmos


class FavoriteProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ratingsView: CosmosView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addBorder() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 5
    }
    
    func setCellData(withProduct: Product) {
        productNameLabel.text = withProduct.name ?? "Product Name"
        productDescriptionLabel.text = withProduct.productDescription ?? "Product Description"
        ratingsView.rating = withProduct.rating ?? 3

        
        // ToDo: Load product Image
    }
    
}
