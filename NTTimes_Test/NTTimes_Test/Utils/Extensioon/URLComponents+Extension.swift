//
//  URLComponents+Extension.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 15/07/23.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
