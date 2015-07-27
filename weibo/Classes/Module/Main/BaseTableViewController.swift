//
//  BaseTableViewController.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/15.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, visitorDelegate {
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
        visitorView?.delegate = self
        view = visitorView
        
        // 导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorResignButtonClicked")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorLoginButtonClicked")
        
    }
    
    func visitorLoginButtonClicked() {
        let story = UIStoryboard(name: "OAuth", bundle: nil)
        presentViewController(story.instantiateInitialViewController() as UIViewController!, animated: true, completion: nil)
    }
    
    func visitorResignButtonClicked() {
        print("注册按钮")
    }

}
