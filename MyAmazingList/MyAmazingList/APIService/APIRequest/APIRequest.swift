//
//  APIRequest.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class APIRequest: NSObject {
    private override init() { }
    public static let shared = APIRequest()
    typealias completion = (_ success: Bool) -> Void
    typealias response = (_ response: [String: Any]?) -> Void
    
    // Do request
    func doRequest(strURL: String,
                   completion: @escaping response) {
        if let url = URL(string: strURL) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                guard let _data = data else {
                    return
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: _data, options: [])
                    if let _dataDict = json as? [String : Any] {
                        completion(_dataDict)
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        }
    }
}
