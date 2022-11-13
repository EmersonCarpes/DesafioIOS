//
//  ViewExtensions.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

extension UIView{
    public func anchor(centerX:(anchor: NSLayoutXAxisAnchor, padding: CGFloat)? = nil,
                       centerY:(anchor: NSLayoutYAxisAnchor, padding: CGFloat)? = nil,
                       top:(anchor: NSLayoutYAxisAnchor, padding: CGFloat)? = nil,
                       left:(anchor: NSLayoutXAxisAnchor, padding: CGFloat)? = nil,
                       right:(anchor: NSLayoutXAxisAnchor, padding: CGFloat)? = nil,
                       bottom:(anchor: NSLayoutYAxisAnchor, padding: CGFloat)? = nil,
                       width: CGFloat? = nil,
                       height: CGFloat? = nil){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX.anchor, constant: centerX.padding).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY.anchor, constant: centerY.padding).isActive = true
        }
        if let top = top {
            self.topAnchor.constraint(equalTo: top.anchor, constant: top.padding).isActive = true
        }
        if let left = left {
            self.leadingAnchor.constraint(equalTo: left.anchor, constant: left.padding).isActive = true
        }
        if let right = right {
            self.trailingAnchor.constraint(equalTo: right.anchor, constant: -right.padding).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom.anchor, constant: -bottom.padding).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

