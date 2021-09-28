import UIKit
import AVFoundation

class ResizingUtil: NSObject {
    
    static func convertToMP4Movie(moviePath: NSURL, quallity: String = AVAssetExportPreset640x480, callBack:@escaping ((URL?)->())) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let basePath = (paths.first ?? "") as NSString
        basePath.appendingPathComponent("videos")
        if !FileManager.default.fileExists(atPath: basePath as String) {
            do {
                try FileManager.default.createDirectory(atPath: basePath as String, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                fatalError("fail to createDirectory")
            }
        }
        
        let fileUrl = NSURL.init(fileURLWithPath: basePath as String)
        let currentTime = Int64(NSDate.init().timeIntervalSinceReferenceDate)
        let fileName = NSString.init(format: "file_%lld.mp4", currentTime) as String
        let asset = AVAsset.init(url: moviePath as URL)
        
        guard let fullFileUrl = fileUrl.appendingPathComponent(fileName) else { return }
        guard let exporter = AVAssetExportSession.init(asset: asset, presetName: quallity) else { return }
        
        exporter.outputFileType = AVFileType.mp4
        exporter.shouldOptimizeForNetworkUse = true
        exporter.outputURL = fullFileUrl
        exporter.exportAsynchronously {
            switch (exporter.status) {
            case .completed:
                print("video converstion status complete")
                callBack(exporter.outputURL)
            case .failed:
                print("video converstion status failed")
                callBack(nil)
            case .cancelled:
                print("video converstion status cancelled")
                callBack(nil)
            case .exporting:
                print("video converstion status exporting")
                callBack(nil)
            case .waiting:
                print("video converstion status waiting")
                callBack(nil)
            case .unknown:
                print("video converstion status unknown")
                callBack(nil)
            }
        }
        
    }
    
    static func maskRoundedImage(_ image: UIImage) -> UIImage? {
        let imageView: UIImageView = UIImageView(image: image)
        let layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = image.size.width / 2.0
        UIGraphicsBeginImageContext(imageView.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage
    }
    
    static func resizingImage(_ image: UIImage, size: CGSize) -> UIImage? {
        var resultImage: UIImage? = nil
        UIGraphicsBeginImageContext(size)
        var targetRect = CGRect.zero
        targetRect.size = size
        targetRect.origin = CGPoint.zero
        image.draw(in: targetRect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
    
}
