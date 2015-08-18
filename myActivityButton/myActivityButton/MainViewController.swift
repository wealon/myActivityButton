//
//  MainViewController.swift
//  myActivityButton
//
//  Created by wealon on 15/8/18.
//  Copyright (c) 2015年 com.8ni. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let btn: ActivityButton = ActivityButton(frame: CGRectMake(20, 320, 200, 30))
    
    // 保存成功
    @IBAction func saveSuccess(sender: AnyObject) {
        self.btnClick()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. Round ImageView 
        setupRoundImageView()
        
        // 2. about the TipButton
        setupActivityButton()
    }
    
    func setupActivityButton() {
        // 设置Activity 为居中展示
        self.btn.activitySytle = ActivityPosition.Center
        self.btn.setTitle("保存房源", forState: UIControlState.Normal)
        self.btn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.btn)

    }
    
    func setupRoundImageView() {
        // 1. about the RoundImageView
        var twoRoundView = RoundImageView(frame: CGRectMake(20, 84, 80, 80))
        twoRoundView.backgroundColor = UIColor.yellowColor()
        twoRoundView.image = UIImage(named: "redsmile")
        self.view.addSubview(twoRoundView)
        
        twoRoundView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClick() {
        let curAnimate = self.btn.animate
        //        printLog("btnClick ---  \(curAnimate)")
        self.btn.animate = !curAnimate!
        
        if curAnimate == false {
            self.btn.enabled = false
            self.btn.setTitle("", forState: UIControlState.Normal)
        } else {
            self.btn.enabled = true
            self.btn.setTitle("保存成功", forState: UIControlState.Normal)
        }
    }

    

}

extension ViewController: RoundImageViewDelegate {
    func roundImageViewClicked(#image: RoundImageView) {
        println("点击了图片")
    }
}
