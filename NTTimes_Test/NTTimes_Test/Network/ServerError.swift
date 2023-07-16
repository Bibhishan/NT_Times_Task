//
//  ServerError.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 16/07/23.
//

import Foundation

enum ServerError : Error {
    case badRequest
    case unknownError
    case forbidden
    case invalidCredentials
    case notFound
    case serverError
    case customError(String)
    
    init (code : Int){
        
        switch code {
        case 400:
            self = .badRequest
        case 402:
            self = .invalidCredentials
        case 430:
            self = .forbidden
        case 404:
            self = .notFound
        case 500:
            self = .serverError
        default:
            self = .unknownError
        }
    }
}


extension ServerError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badRequest: return "Bad Request"
        case .unknownError: return "Unknown error"
        case .forbidden: return "Frobidden"
        case .invalidCredentials: return "Invalid Credentials"
        case .notFound: return "Not Found"
        case .serverError: return "Server Error"
        default : return "Unkown Error"
        }
    }
    
}
