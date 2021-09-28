import Foundation
import UIKit

extension UIViewController {
    
    var previousViewController:UIViewController? {
        if let controllersOnNavStack = self.navigationController?.viewControllers {
            let n = controllersOnNavStack.count
            //if self is still on Navigation stack
            if controllersOnNavStack.last === self, n > 1{
                return controllersOnNavStack[n - 2]
            } else if n > 0{
                return controllersOnNavStack[n - 1]
            }
        }
        return nil
    }
        
    func isModal() -> Bool {
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.first != self {
                return false
            }
        }
        
        if self.presentingViewController != nil {
            return true
        }
        
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        }
        
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
    
//	var isModal: Bool {
//
//		let presentingIsModal = presentingViewController != nil
//		let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
//		let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
//
//		return presentingIsModal || presentingIsNavigation || presentingIsTabBar
//	}
	
	func present(vc: UIViewController, completion: ((Int?)->())?) {
		self.present(vc, animated: true, completion: nil)
	}
}
