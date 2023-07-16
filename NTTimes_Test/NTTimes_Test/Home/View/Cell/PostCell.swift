//
//  PostCell.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bylineLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(item: ArticleModel){
        titleLbl.text = item.title
        bylineLbl.text = item.byline
        dateLbl.text = item.publishedDate
    }
    
}
