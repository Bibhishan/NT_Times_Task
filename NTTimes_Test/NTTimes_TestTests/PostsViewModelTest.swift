//
//  PostsViewModelTest.swift
//  NTTimes_TestTests
//
//  Created by Bibhishan Biradar on 15/07/23.
//

@testable import NTTimes_Test
import XCTest
import Foundation

final class PostsViewModelTest: XCTestCase {

    private var sut: PostViewModel!
    private var apiClient: PostAPIRequestProtocolMock!
        
    override func setUp() {
        apiClient = PostAPIRequestProtocolMock()
        sut = PostViewModel(apiManager: apiClient)
    }
    
    override func tearDown() {
        apiClient = nil
        sut = nil
    }
    
    func test_onViewWillAppear() {
        apiClient.isSuccess = true
        sut.onViewWillAppear(apiKey: NYApiKey.api_key)
        XCTAssertEqual(apiClient.fetchPostsCallCount, 1)
    }
}
