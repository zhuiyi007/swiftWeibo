//
//  OAuthViewController.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/22.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController, UIWebViewDelegate {
    
    let client_id = "3728832152"
    let redirect_url = "http://www.baidu.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadOAuthPage()
        // Do any additional setup after loading the view.
    }
    var webView: UIWebView {
        return view as! UIWebView
    }

    @IBAction func shutDown(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func loadOAuthPage() {
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=" + client_id + "&redirect_uri=" + redirect_url
        let url = NSURL(string: urlStr)!
        webView.loadRequest(NSURLRequest(URL: url))
    }

}
