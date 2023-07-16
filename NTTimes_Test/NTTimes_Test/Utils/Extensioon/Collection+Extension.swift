//
//  Collection+Extension.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 15/07/23.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
