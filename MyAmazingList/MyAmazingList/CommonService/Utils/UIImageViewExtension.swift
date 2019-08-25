//
//  UIImageViewExtension.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

extension UIImageView {
    func applyshadow(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 1.scale()
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: containerView.frame.size.width, height: containerView.frame.size.height)), cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
