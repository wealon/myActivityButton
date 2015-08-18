//
//  ActivityButton.swift
//  testRoundImageView
//
//  Created by wealon on 15/8/17.
//  Copyright (c) 2015年 com.8ni. All rights reserved.
//

import UIKit

func printLog<T>(message: T, file: String = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    println("\(file.lastPathComponent)[\(line)], \(method): \(message)")
}

enum ActivityPosition{
    case Left
    case Center
}

class ActivityButton: UIButton {
    
    // 在按钮中添加的转圈
    var activity: UIActivityIndicatorView?
    
    // Activity 的样式
    var activitySytle: ActivityPosition? {
        didSet {
            // 初始化activity
            activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self.addSubview(activity!)
            activity?.snp_makeConstraints({ (make) -> Void in
                if activitySytle == ActivityPosition.Left {
                    make.left.equalTo(self).offset(2)
                    make.centerY.equalTo(self)
                } else {
                    make.center.equalTo(self)
                }
            })

        }
    }
    
    var animate: Bool? = false {
        didSet {
            if animate == true {
                self.activity?.startAnimating()
            } else {
                self.activity?.stopAnimating()
            }
        }
    }
    
    
    // 一些公共的设置
    func commonSetting() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.titleLabel?.contentMode = UIViewContentMode.Center
        
        // 设置不同状态的背景颜色
        let normalImage = UIImage(named: "buttongreen")
        let highImage = UIImage(named: "buttongreen_highlighted")
        self.setBackgroundImage(normalImage, forState: UIControlState.Normal)
        self.setBackgroundImage(highImage, forState: UIControlState.Disabled)
        self.backgroundColor = UIColor.redColor()
    }
    
    
    // 从xib 或 storyBoard 中加载的时候会调用该init方法
    required init(coder aDecoder: NSCoder) {
        printLog("---coder---")
        super.init(coder: aDecoder)
        commonSetting()
    }

    // 用代码创建的时候会调用此init方法
    override init(frame: CGRect) {
        printLog("---frame---")
        super.init(frame: frame)
        commonSetting()
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
//        printLog("titleRectForContentRect")
        if self.activitySytle == ActivityPosition.Left {
            let rect = CGRectMake(28, 0, self.bounds.size.width, self.bounds.size.height)
            return rect
        }
        return super.titleRectForContentRect(contentRect)
        
    }

}
