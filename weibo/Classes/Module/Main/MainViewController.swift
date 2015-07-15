//
//  MainViewController.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/14.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    // 可以直接放问到自定义tabBar中的按钮
    @IBOutlet weak var mainTabBar: MainTabBar!
    /*
        tabBarController
        tabBar:         大条
        tabBarItem:     小项目
        tabBarButton:   item内部的按钮
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        mainTabBar.plusButton.addTarget(self, action: "plusButtonClicked", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    /**
    加号按钮的点击事件
    */
    func plusButtonClicked () {
        print("点击了加号按钮")
    }
    
    /**
    添加所有的子视图控制器
    */
    private func addChildViewControllers() {
        
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewController("Home", "首页", "tabbar_home")
        addChildViewController("Message", "消息", "tabbar_message_center")
        addChildViewController("Discover", "发现", "tabbar_discover")
        addChildViewController("Profile", "个人", "tabbar_profile")
        

    }
    
    // 重载系统的函数
    private func addChildViewController(storyBoardName: String, _ title: String, _ imageName: String) {
        let story = UIStoryboard(name: storyBoardName, bundle: nil)
        let nav = story.instantiateInitialViewController() as! UINavigationController
        nav.title = title
        nav.topViewController?.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        addChildViewController(nav)
    }
}
