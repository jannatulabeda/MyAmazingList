//
//  AmazingTableCell.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingTableCell: UITableViewCell {

    @IBOutlet weak var viewImageShadow: UIView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
        
    override func layoutSubviews() {
        super.layoutSubviews()
        viewImageShadow.frame.size = CGSize(width: 70.scale(), height: 70.scale())
        imageViewIcon.applyshadow(containerView: viewImageShadow,
                                  cornerRadious: 5.scale())
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelTitle.text = "N/A"
        labelDescription.text = "N/A"
        labelSubTitle.text = "N/A"
        imageViewIcon.image = UIImage(named: "default")
    }
}
