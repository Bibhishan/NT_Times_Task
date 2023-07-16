//
//  PostViewModelMock.swift
//  NTTimes_TestTests
//
//  Created by Bibhishan Biradar on 15/07/23.
//
@testable import NTTimes_Test
import Foundation

final class PostViewModelInputMock: PostViewModelInput {
    
    private(set) var onViewWillAppearCallCount: Int = 0
    private(set) var numberOfPostCountCallCount: Int = 0
    private(set) var getPostCallCount: Int = 0
    
    func onViewWillAppear(apiKey: String) {
        onViewWillAppearCallCount += 1
    }
    
    func numberOfPostCount() -> Int {
        numberOfPostCountCallCount += 1
        return 0
    }
    
    func getData(at index: Int) -> ArticleModel? {
        getPostCallCount += 1
        return nil
    }
}

final class PostViewModelOutputMock: PostViewModelOutput {
    
    private(set) var showPostsCallCount: Int = 0
    private(set) var showErrorCallCount: Int = 0
    
    func showPost() {
        showPostsCallCount += 1
    }
    
    func showError(with message: String) {
        showErrorCallCount += 1
    }
}

final class PostAPIRequestProtocolMock: PostAPIRequestProtocol {
    
    var isSuccess: Bool = false
    private(set) var fetchPostsCallCount: Int = 0
    
    func fetchMockPosts() -> PostModel? {
        if let url = Bundle.main.url(forResource: "Posts", withExtension: "json") {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let data = try Data(contentsOf: url)
                let result = try decoder.decode(PostModel.self, from: data)
                fetchPostsCallCount += 1
                return result
            } catch {
                print("error:\(error)")
                fetchPostsCallCount = 0
                return nil
            }
        }
        return nil
    }
    
    func getAPIData(endPoints: String, completion: @escaping (Result<PostModel?, ServerError>) -> Void) {
        if isSuccess {
            let posts = fetchMockPosts()
            completion(.success(posts))
        } else {
            completion(.failure(.badRequest))
        }
    }
}

