//
//  ProductListViewModel.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation


class ProductListViewModel {
    
    var networkRequestInProgess = false
    var onProductListFetchFaild: ((NetworkError) ->Void)?
    var onProductListFetchSuccess: (()->Void)?
    var productList: [Product] = []
    var listFilters: [String]?
    var listHeader: ListHeader?
    
    
    
    func getProducts() {
        let manager = NetworkManager()
        manager.getPorducts { (error, productListResponseObject) in
            if let error = error {
                self.onFailure(error: error)
            }
            else {
                self.productList = (productListResponseObject?.products)!
                self.listHeader = productListResponseObject?.header
                self.listFilters = productListResponseObject?.filters
                self.onSuccess()
            }
        }
    }
    
    
    func onSuccess() {
        self.networkRequestInProgess = false
        self.onProductListFetchSuccess?()
    }
    
    
    func onFailure(error: NetworkError) {
        self.networkRequestInProgess = false
        self.onProductListFetchFaild?(error)
    }

    
}
