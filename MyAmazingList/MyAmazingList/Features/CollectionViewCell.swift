//
//  CollectionViewCell.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageShadow: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = (imageView.frame.size.width / 2)
        imageView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.image = UIImage(named: "default")
    }
}
