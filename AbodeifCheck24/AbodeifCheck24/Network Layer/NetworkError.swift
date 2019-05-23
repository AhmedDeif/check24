//
//  NetworkError.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

import Foundation

enum NetworkError: Error {
    case noInternetConnection
    case serverError
    case noDataInResponse
    case custom(String)
    case badImageURL(String)
    case other
    case malformedResponse
}


extension NetworkError {
    
    var description: String {
        switch self {
        case .noInternetConnection:
            return "You are not connected to the internet"
        case .serverError:
            return "Something went wrong, please try again later"
        case .noDataInResponse:
            return "Did not get data in response"
        case .badImageURL(let message):
            return message
        case .malformedResponse:
            return "Could not parse response"
        case .custom(let message):
            return message
        case .other:
            return "An unkown error occured"
        }
    }
    
    init(json: [String: Any]) {
        if let message = json["ErrorMsg"] as? String {
            self = .custom(message)
        }
        else {
            self = .other
        }
    }
}

