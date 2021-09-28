import Foundation
import UIKit

func print(debug: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
    #if DEBUG
    print("\n\n---------------------------------------------------------------")
    var filename: NSString = file as NSString
    filename = filename.lastPathComponent as NSString
    Swift.print("파일 = \(filename), 라인 = \(line), 함수 = \(function) \n\(debug)")
    print("---------------------------------------------------------------\n\n")
    #endif
}

