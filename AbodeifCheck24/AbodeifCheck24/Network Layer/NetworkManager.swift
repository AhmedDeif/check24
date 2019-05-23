//
//  NetworkManager.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class NetworkManager: APIProtocol {
    
    func getPorducts() {
        Alamofire.request(EndPoints.getProducts)
            .responseData { response in
                let decoder = JSONDecoder()
                let productListResponse: Result<GetProductListResponse> = decoder.decodeResponse(from: response)
        }
    }
    
    func getImage() {
        // should fetch make api call
    }
    
    
}

// Allow parsing using codable protocol
extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(NetworkError.noDataInResponse)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
