//
//  RoundImageView.swift
//  testRoundImageView
//
//  Created by wealon on 15/8/17.
//  Copyright (c) 2015年 com.8ni. All rights reserved.
//

import UIKit

protocol RoundImageViewDelegate: NSObjectProtocol {

    func roundImageViewClicked(#image: RoundImageView)
}

class RoundImageView: UIImageView {
    
    weak var delegate: RoundImageViewDelegate?

    // 必须要写的
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        println("--init:frame --- ")
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        
        
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderWidth = CGFloat(5)
        
        self.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageClick")
        self.addGestureRecognizer(tapGesture)
        
        
    }
    
    func imageClick() {
        delegate?.roundImageViewClicked(image: self)
    }

}
