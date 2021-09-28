//
//  ExtUIViewController.swift
//  forenaiottmp
//
//  Created by Taesung Kim on 2020/07/21.
//  Copyright © 2020 Taesung Kim. All rights reserved.
//

import UIKit

extension UIViewController {
    // 키보드 내리기
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   
    
    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            // Fallback on earlier versions
            return self.navigationController?.navigationBar.frame.size.height ?? 0.0
        }
    }
    
}
