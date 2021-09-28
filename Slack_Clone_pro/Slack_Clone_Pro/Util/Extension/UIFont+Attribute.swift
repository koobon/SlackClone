//
//  UIFont+Attribute.swift
//  coconut_ios
//
//  Created by 이민철 on 2021/01/18.
//

import Foundation
import UIKit

extension UIViewController {
	
	//font color change
	func fontColor(name: String, size: Int, range: [String],label: UILabel!,color: UIColor) {
		let attributedStr = NSMutableAttributedString(string: label.text!)
		
		let _ = range.compactMap{
			attributedStr.addAttribute(.foregroundColor, value: color, range: (label.text! as NSString).range(of: $0))
			
			attributedStr.addAttribute(.font,value: UIFont(name: name, size: CGFloat(size))!, range: (label.text! as NSString).range(of: $0))
			
		}
		
		label.attributedText = attributedStr
	}
	
}
extension UIView {
	
	//font color change
	func fontColor(name: String, size: Int, range: [String],label: UILabel!,color: UIColor) {
		let attributedStr = NSMutableAttributedString(string: label.text!)
		
		let _ = range.compactMap{
			attributedStr.addAttribute(.foregroundColor, value: color, range: (label.text! as NSString).range(of: $0))
			
			attributedStr.addAttribute(.font,value: UIFont(name: name, size: CGFloat(size))!, range: (label.text! as NSString).range(of: $0))
			
		}
		
		label.attributedText = attributedStr
	}
	
}
