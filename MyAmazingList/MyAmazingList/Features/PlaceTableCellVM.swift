//
//  PlaceTableCellVM.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class PlaceTableCellVM: NSObject {
    
    var url: String = ""
    var imageURL: String = ""
    var title: String = ""
    var contents: String = ""
    
    init(place: AmazingPlaceListRM) {
        url = place.url ?? ""
        imageURL = place.image_url ?? ""
        title = place.title ?? ""
        contents = place.contents ?? ""
    }
}
