//
//  AmazingListRM.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingListRM: NSObject {
    var url: String?
    var image_url: String?
    
    init(response: [String: Any]) {
        url = response["url"] as? String ?? ""
        image_url = response["image_url"] as? String ?? ""
    }
}
