//
//  APIEnvironment.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import Foundation

protocol EnvironmentProtocol {
    var baseURL: String { get }
}

enum APIEnvironment: EnvironmentProtocol {
    
    case development
    
    var baseURL: String {
        switch self {
        case .development:
            return "http://api.nytimes.com/svc/"
        }
    }
}
