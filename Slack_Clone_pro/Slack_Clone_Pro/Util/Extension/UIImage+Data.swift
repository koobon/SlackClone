import Foundation
import UIKit

extension UIImage {

    func getExtension() -> String {
        var ext = ""
        if let _ = self.pngData() {
            ext = "png"
        } else {
            guard let _ = self.jpegData(compressionQuality: 0.9) else {
                fatalError("fail to getExtension")
            }
            ext = "jpg"
        }
        return ext
    }
    
}
