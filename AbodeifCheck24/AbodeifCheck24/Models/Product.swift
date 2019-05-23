//
//  Product.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

struct Product: Codable {
    let name: String?
    let type: String?
    let id: Int?
    let color: String?
    let imageURL: String?
    let colorCode: String?
    let available: Bool?
    let releaseDate: Int?
    let productDescription, longDescription: String?
    let rating: Double?
    let price: ProductPrice?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, color, imageURL, colorCode, available, releaseDate
        case productDescription = "description"
        case longDescription, rating, price
    }
}
