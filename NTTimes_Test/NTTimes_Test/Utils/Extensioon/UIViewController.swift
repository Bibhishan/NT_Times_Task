//
//  UIViewController.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    private func getStoryBoard(with name: String)->UIStoryboard {
        return UIStoryboard.init(name: name, bundle: Bundle.main)
    }
    
    func getViewController<T:UIViewController> (with title:String = "",in storyBoard: String) -> T {
        let vc = String.init(describing: T.self)
        let myViewController = self.getStoryBoard(with: storyBoard).instantiateViewController(withIdentifier: vc)
        myViewController.title = title
        return myViewController as! T
    }
}
