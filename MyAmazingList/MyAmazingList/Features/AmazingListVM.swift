//
//  AmazingListVM.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/25.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingListVM: NSObject {
    let amazingListAPI = AmazingListAPI()

    var topRatedList = [TopRatedCellVM]()
    var placeList = [PlaceTableCellVM]()
    
    // Get top rated list
    func requestForTopRatedList(completion: @escaping (_ topRatedList: [TopRatedCellVM]?) -> Void) {
        amazingListAPI.doGetTopRatedPlaceList { topRatedPlaceList in
            if let _topRatedPlaceList = topRatedPlaceList, _topRatedPlaceList.count > 0 {
                completion(_topRatedPlaceList.map {(TopRatedCellVM(topRatedPlace: $0))})

            }
        }
    }
    
    // Get Place list
    func requestForPlaceList(completion: @escaping (_ placeList: [PlaceTableCellVM]?) -> Void) {
        amazingListAPI.doGetPlaceList { placeList in
            if let _placeList = placeList {
                completion(_placeList.map {(PlaceTableCellVM(place: $0))})
            }
        }
    }
}
