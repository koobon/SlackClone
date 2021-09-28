import UIKit

class VCStackUtil: NSObject {

    //현재 뷰컨트롤러 스택
    static func viewControllerStack() -> [UIViewController]? {
        if let navigationController = HierarchyUtil.currentNavigationController() {
            return navigationController.viewControllers
        }
        else if let topViewController = HierarchyUtil.topViewController() {
            return [topViewController]
        }
        else {
            return nil
        }
    }
    
    //현재 뷰컨트롤러 스택에 뷰컨트롤러를 추가하여 반환
    static func addedViewControllerStack(_ viewController: UIViewController) -> [UIViewController] {
        let optVCs = self.viewControllerStack()
        var resultVCs: [UIViewController] = []
        
        if let VCs = optVCs {
            resultVCs.append(contentsOf: VCs)
        }
        resultVCs.append(viewController)
        return resultVCs
    }
    
    //뷰컨트롤러를 현재의 스택에 푸시 그렇지 못한경우 새롭게 스택생성
    static func pushViewControllerUpsertedCurrentStack(_ viewController: UIViewController, _ animated: Bool) {
        let vcs = self.addedViewControllerStack(viewController)
        self.pushViewControllerStack(vcs, animated)
    }
    
    //뷰컨트롤러 스택을 설정
    static func pushViewControllerStack(_ viewControllers: [UIViewController], _ animated: Bool) {
        
        if let navigationController = HierarchyUtil.currentNavigationController() {
            navigationController.setViewControllers(viewControllers, animated: animated)
        }
        else {
            guard let firstViewController = viewControllers.first else { return }
            let navigationController = UINavigationController.init(rootViewController: firstViewController)
            navigationController.navigationBar.isHidden = true
            navigationController.setViewControllers(viewControllers, animated: animated)
            UIApplication.shared.delegate?.window??.rootViewController = navigationController
        }
        
    }
    
}
