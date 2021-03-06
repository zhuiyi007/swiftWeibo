//
//  visitor.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/15.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

// 要遵守NSObjectProtocol协议
protocol visitorDelegate: NSObjectProtocol{
    // 点击登录按钮
    func visitorLoginButtonClicked()
    // 点击注册按钮
    func visitorResignButtonClicked()
}

class visitor: UIView {
    @IBOutlet weak var centerIcon: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var roundWeel: UIImageView!
    
    weak var delegate: visitorDelegate?
    
    // 传递参数的时候可以传递一个默认值,就不用到处改代码了
    func createUI(centerIcon: String, _ textLabel: String, _ isHome: Bool = false) {
        if isHome {
            self.centerIcon.hidden = false
            self.centerIcon.image = UIImage(named: centerIcon)
            self.roundWeel.image = UIImage(named: "visitordiscover_feed_image_smallicon")
            startAnimation()
        } else {
            self.centerIcon.hidden = true
            self.roundWeel.image = UIImage(named: centerIcon)
        }
        self.textLabel.text = textLabel
    }
    
    /**
    开始动画
    */
    func startAnimation() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        // 当动画结束的时候移除,默认为true,如果不移除动画的话,每次都会往图层上新加动画
//        anim.removedOnCompletion = false
        roundWeel.layer.addAnimation(anim, forKey: nil)
    }
    
    
    @IBAction func resignButtonClicked(sender: UIButton) {
        delegate?.visitorResignButtonClicked()
    }
    @IBAction func loginButtonClicked(sender: UIButton) {
        delegate?.visitorLoginButtonClicked()
    }
}
