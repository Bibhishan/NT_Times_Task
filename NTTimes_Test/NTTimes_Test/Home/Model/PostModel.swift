//
//  PostModel.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import Foundation

typealias PostData = [ArticleModel]

// MARK: - PostModel
struct PostModel: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [ArticleModel]
}

// MARK: - Result
struct ArticleModel: Codable {
    let publishedDate: String
    let byline: String
    let type: String
    let title, abstract: String
}
