import Foundation
import UIKit

extension UIAlertController {

    static func showAlertWithViewController(_ viewController: UIViewController? = HierarchyUtil.topViewController(), title: String, message: String, finishBock:(()->())?) {
        
        guard let viewController = viewController else { return }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction.init(title: "확인", style: UIAlertAction.Style.default) { (action) in
            if let block = finishBock { block() }
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    static func showSelectWithViewController(_ viewController: UIViewController? = HierarchyUtil.topViewController(), title: String, message: String, finishBock:(()->())?) {
        
        guard let viewController = viewController else { return }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction.init(title: "확인", style: UIAlertAction.Style.default) { (action) in
            if let block = finishBock { block() }
            alert.dismiss(animated: true, completion: nil)
        }
        let cancel = UIAlertAction.init(title: "취소", style: UIAlertAction.Style.default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    static func showBottomSelectWithViewController(_ viewController: UIViewController? = HierarchyUtil.topViewController(), title: String?, message: String?, btnTitles: [String?], actionBlocks: [(()->())?], finishBlock:(()->())?) {
        
        guard let viewController = viewController else { return }
        if btnTitles.count != actionBlocks.count {
            print("showBottomSelectWithViewController different count error")
            return
        }
        
        let alertView = UIAlertController.init(title: title, message: message, preferredStyle: .actionSheet)
        
        for i in 0..<btnTitles.count {
            let btnTitle = btnTitles[i]
            let actionBlock = actionBlocks[i]
            
            let alertAction = UIAlertAction.init(title: btnTitle, style: .default, handler: { (action) in
                if let actionBlock = actionBlock {
                    actionBlock()
                }
            })
            alertView.addAction(alertAction)
        }
        
        let cancelAction = UIAlertAction.init(title: "취소", style: .cancel, handler: { (action) in
            alertView.dismiss(animated: true, completion: {
                if let finishBlock = finishBlock {
                    finishBlock()
                }
            })
        })
        alertView.addAction(cancelAction)
        
        viewController.present(alertView, animated: true, completion: nil)
    }

}
