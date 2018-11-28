//
//  t.swift
//  4A5
//
//  Created by Ahmed Abdallah on 2/13/18.
//  Copyright © 2018 Ahmed Abdallah. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func hideSeparator() {
        
        for view in subviews where view != contentView {
            let sView = UIView(frame: view.frame)
            view.removeFromSuperview()
           // sView.backgroundColor = Colors.whiteColor
            //self.addSubview(sView)
        }
//        for subview in subviews where NSStringFromClass(subview.classForCoder) == "_UITableViewCellSeparatorView" {
//            subview.removeFromSuperview()
//        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        for view in subviews where view != contentView {
//            view.removeFromSuperview()
//        }
    
 //   }
//        self.layoutMargins = .zero
//        self.separatorInset = .zero
////        self.separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
//    }
    
    func showSeparator() {
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
