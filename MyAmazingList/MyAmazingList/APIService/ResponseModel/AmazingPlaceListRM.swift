//
//  AmazingPlaceListRM.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingPlaceListRM: NSObject {
    var title: String?
    var contents: String?
    var url: String?
    var image_url: String?
    
    init(response: [String: Any]) {
        title = response[APIConstants.Title] as? String ?? ""
        contents = response[APIConstants.Content] as? String ?? ""
        url = response[APIConstants.URL] as? String ?? ""
        image_url = response[APIConstants.ImageURL] as? String ?? ""
    }
}
