//
//  ScaledHeightImageView.swift
//  HatApp
//
//  Created by Denis Makovets on 1/3/20.
//  Copyright © 2020 Denis Makovets. All rights reserved.
//

import Foundation
import UIKit

let containerView = UIView(frame: CGRect(x:0,y:0,width:320,height:500))
let imageView = UIImageView()

if let image = UIImage(named: "Hat") {
    let ratio = image.size.width / image.size.height
    if containerView.frame.width > containerView.frame.height {
        let newHeight = containerView.frame.width / ratio
        imageView.frame.size = CGSize(width: containerView.frame.width, height: newHeight)
    }
    else{
        let newWidth = containerView.frame.height * ratio
        imageView.frame.size = CGSize(width: newWidth, height: containerView.frame.height)
    }
}
