//
//  AmazingTableCell.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class PlaceTableCell: UITableViewCell {

    @IBOutlet weak var viewImageShadow: UIView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
        
    override func layoutSubviews() {
        super.layoutSubviews()
        viewImageShadow.frame.size = CGSize(width: 60.scale(), height: 60.scale())
        imageViewIcon.applyshadow(containerView: viewImageShadow,
                                  cornerRadious: 5.scale())
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelTitle.text = "N/A"
        labelDescription.text = "N/A"
        imageViewIcon.image = UIImage(named: "default")
    }
    
    // Update data
    func updateData(info: PlaceTableCellVM) {
        labelTitle.text = info.title
        labelDescription.text = info.contents
        if let _imageURL = URL(string: info.imageURL) {
            imageViewIcon.downloadImage(link: _imageURL)
        }
    }
}
