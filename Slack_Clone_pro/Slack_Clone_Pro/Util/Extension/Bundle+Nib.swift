import Foundation
import UIKit

extension Bundle {
    func loadNibNameFirst(_ nibName: String) -> Any? {
        let optNibs = self.loadNibNamed(nibName, owner: nil, options: nil)
        if let nibs = optNibs {
            return nibs.first
        }
        return nil
    }
    
    func loadNibNameLast(_ nibName: String) -> Any? {
        let optNibs = self.loadNibNamed(nibName, owner: nil, options: nil)
        if let nibs = optNibs {
            return nibs.last
        }
        return nil
    }
    
    func loadNibName(_ nibName: String, ofRestorationID: String) -> UIView? {
        let optNibs = self.loadNibNamed(nibName, owner: nil, options: nil)
        if let nibs = optNibs {
            for nib in nibs {
                if let result = nib as? UIView,
                    let restorationIdentifier = result.restorationIdentifier {
                    if restorationIdentifier.elementsEqual(ofRestorationID) {
                        return result
                    }
                }
            }
        }
        return nil
    }
}
