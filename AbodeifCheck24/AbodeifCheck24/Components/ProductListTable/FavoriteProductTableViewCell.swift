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
    var indexPath:IndexPath!
    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.imageView?.image = nil
    }
    
    func addBorder() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 5
    }
    
    func setCellData(withProduct: Product, index: Int) {
        productNameLabel.text = withProduct.name ?? "Product Name"
        productDescriptionLabel.text = withProduct.productDescription ?? "Product Description"
        ratingsView.rating = withProduct.rating ?? 3
        startLoading()
        NetworkManager.shared().downloadCellImage(imageUrl: withProduct.imageURL ?? "", index: index) { (error, image, index) in
            if let downloadedImage = image {
                DispatchQueue.main.async {
                    self.stopLoading()
                    guard let index = index else {
                        print("bad index")
                        return
                    }
                    if (self.indexPath.row == index) {
                        self.productImage?.image = downloadedImage
                    }
                    
                }
            }
        }
    }
    
    func startLoading() {
        activityIndicator.center = self.productImage.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.style = UIActivityIndicatorView.Style.gray;
        self.containerView.addSubview(activityIndicator)
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }

}

