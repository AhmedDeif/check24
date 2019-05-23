//
//  MockManager.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation


class MockNetworkManager: APIProtocol {
    
    func getPorducts(completion: @escaping(_ error: NetworkError?, _ data: GetProductListResponse?)->()) {
        // should fetch mocked api response
    }
    
    func getImage(completion: ()) {
        // should fetch mocked api response
    }
    
    
}
