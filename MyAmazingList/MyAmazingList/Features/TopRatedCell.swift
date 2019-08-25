//
//  TopRatedCell.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class TopRatedCell: UICollectionViewCell {

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
    
    // Update data
    func updateData(info: TopRatedCellVM) {
        if let _imageURL = URL(string: info.imageURL) {
            imageView.downloadImage(link: _imageURL)
        }
    }
}
