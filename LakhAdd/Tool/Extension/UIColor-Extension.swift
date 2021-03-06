//
//  UIColor-Extension.swift
//  HYPageView
//
//  Created by seemygo on 17/4/8.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    class var randomColor : UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g : CGFloat(arc4random_uniform(256)), b : CGFloat(arc4random_uniform(256)))
    }
    
    convenience init?(hex : String, alpha : CGFloat = 1.0) {
        // ff0011
        // 0xFF0011
        // ##ff0022
        
        // 1.判断字符串长度是否大于等于6
        guard hex.characters.count >= 6 else {
            return nil
        }
        
        // 2.将所有的字符串转成大写
        var hexString = hex.uppercased()
        
        // 3.判断是否以0x/##
        if (hexString.hasPrefix("##") || hexString.hasPrefix("0x")) {
            // as 将String类型转成NSString
            hexString = (hexString as NSString).substring(from: 2)
        }
        
        // 4.判断是否以#开头
        if (hexString.hasPrefix("#")) {
            // as 将String类型转成NSString
            hexString = (hexString as NSString).substring(from: 1)
        }
        
        // FF0011
        // 结构体是值类型  类是引用类型
        // 5.获取RGB的字符串
        var range = NSRange(location: 0, length: 2)
        let rStr = (hexString as NSString).substring(with: range)
        range.location = 2
        let gStr = (hexString as NSString).substring(with: range)
        range.location = 4
        let bStr = (hexString as NSString).substring(with: range)
        
        // 6.转成10进制的值
        // UnsafeMutablePointer : 指针/地址
        var r : UInt32 = 0
        var g : UInt32 = 0
        var b : UInt32 = 0
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        self.init(r : CGFloat(r), g : CGFloat(g), b : CGFloat(b), alpha : alpha)
    }
    
    func getRGB() -> (CGFloat, CGFloat, CGFloat) {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (red * 255, green * 255, blue * 255)
    }
}












