//
//  Utils.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class Utils {
    
    // MARK: - Constants
    static let mainWindow: UIWindow? = UIApplication.shared.delegate?.window as? UIWindow
    static let screenSize: CGRect = UIScreen.main.bounds
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat    = UIScreen.main.bounds.height
    static let scale: CGFloat = Utils.screenSize.width / 375.0
    
    // Get top padding
    static func getTopPadding() -> CGFloat {
        
        var topPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
                topPadding = appDelegate.window?.safeAreaInsets.top ?? 0.0
            }
        }
        return topPadding
    }
    
    // Get bottom padding
    static func getBottomPadding() -> CGFloat {
        
        var bottomPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
                bottomPadding = appDelegate.window?.safeAreaInsets.bottom ?? 0.0
            }
        }
        return bottomPadding
    }
    
    // Show Alert
    func showAlert(message:String){
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        //show alert on main window
        let _window = UIApplication.shared.keyWindow
        _window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
