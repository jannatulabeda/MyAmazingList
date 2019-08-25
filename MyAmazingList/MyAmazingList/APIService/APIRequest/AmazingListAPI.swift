//
//  AmazingListAPI.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingListAPI {
    
    // Get amazing place list
    func doGetAmazingPlaceList(completion: @escaping (_ amazingList: [AmazingListRM]?) -> Void) {
        
        let strURL = "http://www.mocky.io/v2/5d60c04c2f000050005f3cec"
        APIRequest.shared.doRequest(strURL: strURL) { (response) in
            if let _response = response, let _placesList = _response["places"] as? [[String: Any]] {
                var placeList = [AmazingListRM]()
                for place in _placesList {
                    placeList.append(AmazingListRM(response: place))
                }
                completion(placeList)
            }
        }
    }
}
