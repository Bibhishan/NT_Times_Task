//
//  ArticleDetailsVC.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bylineLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    private var articleDetails: ArticleModel?
    
    init?(coder: NSCoder, articleVM: ArticleModel) {
        super.init(coder: coder)
        self.articleDetails = articleVM
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a vm.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setArticleDetails()
    }
    
    private func setArticleDetails(){
        titleLbl.text = articleDetails?.title
        bylineLbl.text = "Produced " + (articleDetails?.byline ?? "")
        dateLbl.text = articleDetails?.publishedDate
        detailsLbl.text = articleDetails?.abstract
    }

}
