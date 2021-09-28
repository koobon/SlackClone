import Foundation
import UIKit

extension UIActivityViewController {

    static func showActivity(_ viewController: UIViewController? = HierarchyUtil.topViewController(), popoverView: UIView? = nil, contents: [Any], completionBlock: (()->())?) {
        
        guard let viewController = viewController else {
            fatalError("showActivity viewController is nil")
        }
        
        let activities = UIActivityViewController.init(activityItems: contents, applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .phone {
            viewController.present(activities, animated: true, completion: completionBlock)
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            guard let popoverView = popoverView else {
                fatalError("showActivity popoverView is nil")
            }
            activities.popoverPresentationController?.sourceView = popoverView
            activities.popoverPresentationController?.sourceRect = popoverView.frame
            
            viewController.present(activities, animated: true, completion: nil)
        }
        
    }

}
