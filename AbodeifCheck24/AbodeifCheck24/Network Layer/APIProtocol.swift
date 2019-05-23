//
//  APIProtocol.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation


protocol APIProtocol {

    func getPorducts(completion: @escaping(_ error: NetworkError?, _ data: GetProductListResponse?)->())
    func getImage(completion: ())
    
}
