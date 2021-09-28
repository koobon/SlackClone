import Foundation
import UIKit

extension NSString {

    func parseQueryParams() -> NSDictionary {
        
        let params = NSMutableDictionary.init()
        
        let questionComponents = self.components(separatedBy: "?")
        if questionComponents.count != 2 {
            print("fail to parseQueryParams")
            return [:]
        }
        else {
            if let paramString = questionComponents.last {
                let paramPairs = paramString.components(separatedBy: "&")
                for paramPair in paramPairs {
                    let paramComponents = paramPair.components(separatedBy: "=")
                    params.setObject(paramComponents.last ?? "", forKey: (paramComponents.first ?? "") as NSCopying)
                }
            }
            else {
                print("fail to parseQueryParams")
                return [:]
            }
        }
        
        return params.copy() as! NSDictionary        
    }
    
}
