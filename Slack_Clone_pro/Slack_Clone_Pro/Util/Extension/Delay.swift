import Foundation
import UIKit

func dispatchDelay(delay:Double, closure: @escaping ()->()) {
	DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
