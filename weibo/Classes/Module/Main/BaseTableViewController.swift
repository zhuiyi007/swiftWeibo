//
//  BaseTableViewController.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/15.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    // 用户是否登录
    var isLogin = false
    
    var visitorView: visitor?
    
    override func loadView() {
        // 如果用户登录了,则一切正常,不做任何操作
        if isLogin {
            super.loadView()
            return
        }
        // 如果用户没有登录,则替换视图
        visitorView = NSBundle.mainBundle().loadNibNamed("visitor", owner: nil, options: nil).first as? visitor
        view = visitorView
        
    }

}
