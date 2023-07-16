//
//  UIview+Extension.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 16/07/23.
//

import Foundation
import UIKit

extension UITableView {
    
    func noDataView(with message: String = "No Records Found"){
        let noDataLabel : UILabel = UILabel()
        noDataLabel.sizeToFit()
        noDataLabel.center.x = self.center.x
        noDataLabel.center.y = self.frame.height - noDataLabel.frame.height
        noDataLabel.text = message
        noDataLabel.textColor = .black
        noDataLabel.textAlignment = .center
        self.backgroundView = noDataLabel
        self.separatorStyle = .none
    }
    
}
