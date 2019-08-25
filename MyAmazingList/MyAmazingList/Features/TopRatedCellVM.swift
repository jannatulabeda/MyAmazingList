//
//  TopRatedCellVM.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class TopRatedCellVM: NSObject {
    var url: String = ""
    var imageURL: String = ""
    
    init(topRatedPlace: TopRatedPlaceListRM) {
        url = topRatedPlace.url ?? ""
        imageURL = topRatedPlace.image_url ?? ""
    }
}
