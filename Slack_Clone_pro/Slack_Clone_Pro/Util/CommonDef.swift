import Foundation
import UIKit
import RxCocoa
import RxSwift

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

var SPRING_WITH_DAMPING: CGFloat = 0.9
var SPRING_VELOCITY: CGFloat = 0.5

let SHADOW_SIZE: CGSize = CGSize(width: 0.0, height: 2.0)
let SHADOW_OPACITY: Float = 0.2 // 0.7
let SHADOW_RADIUS: CGFloat = 4.0 // 2.0


var CALENDAR: Calendar {
    get {
        return Calendar.current
    }
}

var BUNDLE: Bundle {
    get {
        return Bundle.main
    }
}

var ROOT_VC: UIViewController? {
    get {
        return UIApplication.shared.delegate?.window??.rootViewController
    }
    set(newValue) {
        UIApplication.shared.delegate?.window??.rootViewController = newValue
    }
}

var ROOT_NAVI: UINavigationController? {
    return (UIApplication.shared.windows[0].rootViewController as! UINavigationController)
}

var KEY_WINDOW: UIWindow? {
    get {
        return UIApplication.shared.keyWindow
    }
}

func TRIM(_ value: String) -> String {
    return value.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
}

func EMPTY(_ value: String?) -> Bool {
    if let value = value {
        return TRIM(value).count == 0
    }
    return false
}

func EQUALS(_ value1: String, _ value2: String) -> Bool {
    return value1 == value2
}
