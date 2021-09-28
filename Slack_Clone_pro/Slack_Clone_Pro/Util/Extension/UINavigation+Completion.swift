import Foundation
import UIKit

extension UINavigationController {
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        pushViewController(viewController, animated: animated)
//        CATransaction.commit()
        pushViewController(viewController, animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
    
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        popViewController(animated: animated)
//        CATransaction.commit()
        popViewController(animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}
