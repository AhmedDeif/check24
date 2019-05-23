//
//  GetProductListResponse.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

// MARK: - GetProductListResponse
struct GetProductListResponse: Codable {
    let header: ListHeader?
    let filters: [String]?
    let products: [Product]?
}
