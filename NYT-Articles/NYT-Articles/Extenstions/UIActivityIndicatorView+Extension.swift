//
//  UIActivityIndicatorView+Extension.swift
//  NYT-Articles
//
//  Created by Kyrylo Hanichev on 26.03.2021.
//

import UIKit

extension UIActivityIndicatorView {
  
  internal func scaleIndicator(factor: CGFloat) {
    transform = CGAffineTransform(scaleX: factor, y: factor)
  }
}
