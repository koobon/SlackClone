//
//  UIViewController+MemoryLeak.swift
//  Pay Manager
//
//  Created by swany on 2020/11/09.
//  Copyright © 2020 Swan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func dch_checkDeallocation(afterDelay delay: TimeInterval = 2.0) {
        let rootParentViewController = dch_rootParentViewController
        
        // We don’t check isBeingDismissed simply on this view controller because it’s common
        // to wrap a view controller in another view controller (e.g. in UINavigationController)        
        // and present the wrapping view controller instead.
        
        if isMovingFromParent || rootParentViewController.isBeingDismissed {
            let disappearanceSource: String = isMovingFromParent ? "removed from its parent" : "dismissed"
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { [weak self] in
                print(self)
                assert(self == nil, "\(type(of: self)) not deallocated after being \(disappearanceSource)")
            })
        }
    }
    
    private var dch_rootParentViewController: UIViewController {
        var root = self
        while let parent = root.parent {
            root = parent
        }
        return root
    }
}

func subclasses<T>(of theClass: T) -> [T] {
    var count: UInt32 = 0, result: [T] = []
    let allClasses = objc_copyClassList(&count)!
    
    for n in 0 ..< count {
        let someClass: AnyClass = allClasses[Int(n)]
        guard let someSuperClass = class_getSuperclass(someClass), String(describing: someSuperClass) == String(describing: theClass) else { continue }
        result.append(someClass as! T)
    }
    
    return result
}
