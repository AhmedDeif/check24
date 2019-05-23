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

class NetworkManager {
    
    func getPorducts(completion: @escaping (_ error: NetworkError?, _ data: GetProductListResponse?)->()) {
        Alamofire.request(EndPoints.getProducts)
            .responseData { response in
                switch response.result {
                case .success:
                    let decoder = JSONDecoder()
                    let responseObject: Result<GetProductListResponse> = decoder.decodeResponse(from: response)
                    guard let data = responseObject.value else {
                        print("empty response")
                        completion(NetworkError.noDataInResponse, nil)
                        return
                    }
                    completion(nil, data)
                case .failure(let error):
                    print(error)
                    completion(NetworkError.serverError, nil)
                }
        }
    }
    
    func getImage(completion: ()) {
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
            return .failure(NetworkError.noDataInResponse)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(NetworkError.malformedResponse)
        }
    }
}
