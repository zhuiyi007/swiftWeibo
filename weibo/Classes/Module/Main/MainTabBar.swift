//
//  MainTabBar.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/15.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemCount: CGFloat = 5
        let width = self.frame.size.width / itemCount
        let height = self.frame.size.height
        let frame = CGRectMake(0, 0, width, height)
        var i: CGFloat = 0
        for view in subviews as [UIView] {
            if view.isKindOfClass(UIControl) && !view.isKindOfClass(UIButton){
                view.frame = CGRectOffset(frame, width * i, 0)
                i++
                if i == 2 {
                    i++
                }
            }
        }
        
        self.plusButton.frame = CGRectOffset(frame, width * 2, 0)
    }
    
    lazy var plusButton: UIButton = {
        // [[UIButton alloc] init]出来的button就是custom类型的
//        let btn = UIButton(type: UIButtonType.Custom)
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState:UIControlState.Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState:UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        self.addSubview(btn)
        return btn
    }()
}
