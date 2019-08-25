//
//  AmazingListAPI.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingListAPI {
    
    // Get top rated place list
    func doGetTopRatedPlaceList(completion: @escaping (_ topRatedList: [TopRatedPlaceListRM]?) -> Void) {
        let strURL = "http://www.mocky.io/v2/5d60c04c2f000050005f3cec"
        APIRequest.shared.doRequest(strURL: strURL) { (response) in
            if let _response = response, let _placesList = _response[APIConstants.Places] as? [[String: Any]] {
                var topRatedPlaceList = [TopRatedPlaceListRM]()
                for place in _placesList {
                    topRatedPlaceList.append(TopRatedPlaceListRM(response: place))
                }
                completion(topRatedPlaceList)
            }
        }
    }
    
    // Get place list
    func doGetPlaceList(completion: @escaping (_ placeList: [AmazingPlaceListRM]?) -> Void) {
        
        let strURL = "http://www.mocky.io/v2/5d60ee3e32000059008e5fd5"
        APIRequest.shared.doRequest(strURL: strURL) { (response) in
            if let _response = response, let _placesList = _response["areas"] as? [[String: Any]] {
                var placeList = [AmazingPlaceListRM]()
                for place in _placesList {
                    placeList.append(AmazingPlaceListRM(response: place))
                }
                completion(placeList)
            }
        }
    }
}
