import UIKit

class CookieUtil: NSObject {
    
    static func storeCookie() {
        let cookieJar = HTTPCookieStorage.shared
        let count = cookieJar.cookies?.count ?? 0
        if count > 0 {
            let cookieData: NSData = NSKeyedArchiver.archivedData(withRootObject: cookieJar.cookies as Any) as NSData
            UserDefaults.standard.set(cookieData, forKey: "SavedCookies")
        }
    }
    
    static func restoreCookie() {
        let optCookieData = UserDefaults.standard.object(forKey: "SavedCookies") as? NSData
        if let cookieData = optCookieData {
            if cookieData.length > 0 {
                let optCookies = NSKeyedUnarchiver.unarchiveObject(with: cookieData as Data) as? [HTTPCookie]
                guard let cookies = optCookies else {
                    return
                }
                
                for cookie in cookies {
                    HTTPCookieStorage.shared.setCookie(cookie)
                }
            }
        }
    }
}
