//
//  StoryboardUtill.swift
//  coconut_ios
//
//  Created by 이민철 on 2020/12/29.
//

import Foundation
import UIKit


struct StoryUtill {
	
	static func instantiate(from storyboard: String = "Main") -> UIViewController? {
		let sb = UIStoryboard(name: storyboard, bundle: nil)
		
		guard let nav = sb.instantiateInitialViewController() as? UINavigationController else {
			return nil
		}
		guard let vc = nav.viewControllers.first else {
			return nil
		}
		return vc
	}
	
}
