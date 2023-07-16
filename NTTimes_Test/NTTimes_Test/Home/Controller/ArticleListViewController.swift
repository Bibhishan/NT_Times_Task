//
//  HomeVC.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    private var viewModel = PostViewModel(apiManager: ApiManager())
    
    private let postCell = "PostCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NY Times Most Popular"
        getNewsData()
        registerPostCell()
    }
    
    private func getNewsData(){
        viewModel.delegate = self
        viewModel.onViewWillAppear(apiKey: NYApiKey.api_key)
    }
    
    private func registerPostCell(){
        postTableView.register(UINib(nibName: postCell, bundle: nil), forCellReuseIdentifier: postCell)
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPostCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let items = viewModel.getData(at: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath) as? PostCell{
            cell.updateCell(item: items)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let items = viewModel.getData(at: indexPath.row){
            guard let vc = self.storyboard?.instantiateViewController(identifier: String(describing: ArticleDetailsVC.self), creator: { coder in
                return ArticleDetailsVC(coder: coder, articleVM: items)
            }) else {
                fatalError("Failed to load Article Details from home storyboard.")
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ArticleListViewController: PostViewModelOutput {
    
    func showPost() {
        self.postTableView.reloadData()
    }
    
    func showError(with message: String) {
        self.postTableView.noDataView()
    }
}
