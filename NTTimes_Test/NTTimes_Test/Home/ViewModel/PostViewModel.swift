//
//  PostViewModel.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import Foundation

protocol PostViewModelInput {
    func onViewWillAppear(apiKey: String)
    func numberOfPostCount() -> Int
    func getData(at index: Int) -> ArticleModel?
}

protocol PostViewModelOutput: AnyObject {
    func showPost()
    func showError(with message: String)
}

class PostViewModel: PostViewModelInput{
    
    private let apiManager: PostAPIRequestProtocol
    weak var delegate: PostViewModelOutput?
    private var items: PostData?
    
    init(apiManager: PostAPIRequestProtocol){
        self.apiManager = apiManager
    }
    
    func onViewWillAppear(apiKey: String) {
        getArticles(query: ["api-key": apiKey])
    }
    
    func numberOfPostCount() -> Int {
        return items?.count ?? 0
    }
    
    func getData(at index: Int) -> ArticleModel? {
        return items?[safe: index]
    }
    
    private func getArticles(query: [String:String]){
        var urlComponents = URLComponents()
        urlComponents.setQueryItems(with: query)
        apiManager.getAPIData(endPoints: Endpoints.posts.rawValue + (urlComponents.url?.absoluteString)!) { (result: Result<PostModel?,ServerError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let post):
                    guard let data = post?.results else{
                        self.delegate?.showError(with: "No Records Found")
                        return
                    }
                    self.items = data
                    self.delegate?.showPost()
                case .failure(let error):
                    self.delegate?.showError(with: error.localizedDescription)
                }
            }
        }
    }
}
