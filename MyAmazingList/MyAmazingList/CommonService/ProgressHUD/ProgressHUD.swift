//
//  ProgressHUD.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class ProgressHUD: UIView {
    
    let activityIndicator = UIActivityIndicatorView()
    let container = UIView()
    static let shared = ProgressHUD()
    
    private init() {
        super.init(frame: UIApplication.shared.keyWindow!.frame)
        self.setupProgressHUD()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProgressHUD()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupProgressHUD() {
        
        self.backgroundColor = .clear
        
        // Container
        self.container.frame.size = CGSize(width: 80.scale(), height: 80.scale())
        self.container.center = self.center
        self.container.backgroundColor = UIColor._indicatorBackgroundColor()
        self.container.layer.cornerRadius = 10.scale()
        self.addSubview(self.container)
        
        // Activity Indicator
        let origin = (80.scale() - 80.scale()) / 2
        let size = 80.scale()
        self.activityIndicator.frame = CGRect(x: origin, y: origin, width: size, height: size)
        self.activityIndicator.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        self.activityIndicator.style = .gray
        self.container.addSubview(self.activityIndicator)
    }
    
    func show() {
        self.activityIndicator.startAnimating()
        UIApplication.shared.keyWindow!.addSubview(self)
        self.perform(#selector(self.hide), with: nil, afterDelay: 10.0)
    }
    
    @objc func hide() {
        self.activityIndicator.stopAnimating()
        self.removeFromSuperview()
    }
}
