//
//  visitor.swift
//  weibo
//
//  Created by ZhuiYi on 15/7/15.
//  Copyright © 2015年 ZhuiYi. All rights reserved.
//

import UIKit

class visitor: UIView {
    @IBOutlet weak var centerIcon: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var roundWeel: UIImageView!
    
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
            stopAnimation()
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
        roundWeel.layer.addAnimation(anim, forKey: nil)
    }
    
    /**
    停止动画
    */
    func stopAnimation() {
        roundWeel.layer.removeAllAnimations()
    }
    
    @IBAction func resignButtonClicked(sender: UIButton) {
    }
    @IBAction func loginButtonClicked(sender: UIButton) {
    }
}
