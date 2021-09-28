import UIKit

class HierarchyUtil: NSObject {

    //최상위 뷰컨트롤러
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    //현재 네비게이션 컨트롤러
    static func currentNavigationController() -> UINavigationController? {
        return self.topViewController()?.navigationController
    }
    
}
