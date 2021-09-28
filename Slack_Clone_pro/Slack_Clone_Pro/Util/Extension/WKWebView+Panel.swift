import Foundation
import UIKit
import WebKit

extension WKWebView {

    func presentAlertOnController(parentController: UIViewController, title: NSString?, message: NSString?, completionHandler: (()->())?) {
        
        let alertController = UIAlertController.init(title: title as String?,
                                                     message: message as String?,
                                                     preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction.init(title: "확인", style: UIAlertAction.Style.cancel, handler: { (action) in
            if let block = completionHandler {
                block()
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
        
    }
    
    func presentConfirmOnController(parentController: UIViewController, title: NSString?, message: NSString?, completionHandler: ((Bool)->())?) {
        
        let alertController = UIAlertController.init(title: title as String?,
                                                     message: message as String?,
                                                     preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction.init(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in
            if let block = completionHandler {
                block(true)
            }
        }))
        
        alertController.addAction(UIAlertAction.init(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action) in
            if let block = completionHandler {
                block(false)
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
        
    }
    
    func presentPromptOnController(parentController: UIViewController, title: NSString?, message: NSString?, defaultText: NSString?, completionHandler: ((String?)->())?) {
        
        let alertController = UIAlertController.init(title: title as String?,
                                                     message: message as String?,
                                                     preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField) in
            textField.text = defaultText as String?
        }
        alertController.addAction(UIAlertAction.init(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in
            let input = alertController.textFields?.first?.text ?? ""
            if let block = completionHandler {
                block(input)
            }
        }))
        
        alertController.addAction(UIAlertAction.init(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action) in
            if let block = completionHandler {
                block(nil)
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
        
    }
    
}
