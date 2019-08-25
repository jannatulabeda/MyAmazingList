//
//  DetailOnWebVC.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit
import WebKit

class DetailOnWebVC: UIViewController {

    var webLink: String = ""
    
    var mWKWebView: WKWebView = {
        let width = Utils.screenWidth
        let height = Utils.screenHeight
        let view = WKWebView(frame: CGRect(x: 0, y: Utils.getTopPadding(), width: width, height: height))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSubviews()
    }
    
    // MARK: - Other methods
    func loadWebView() {
        if let requestURL = URL(string: self.webLink) {
            ProgressHUD.shared.show()
            self.mWKWebView.load(URLRequest(url: requestURL))
        }
    }
    
    // Create subviews
    private func createSubviews() {
        self.mWKWebView.navigationDelegate = self
        self.loadWebView()
        self.view.addSubview(self.mWKWebView)
    }
}

// MARK: - UIWebViewDelegate
extension DetailOnWebVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        ProgressHUD.shared.hide()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ProgressHUD.shared.hide()
    }
}
