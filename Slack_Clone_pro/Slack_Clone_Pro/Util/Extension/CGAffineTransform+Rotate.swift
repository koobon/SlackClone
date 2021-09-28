import Foundation
import UIKit

func rotate(angle: CGFloat) -> CGAffineTransform {
	return CGAffineTransform(rotationAngle: angle * .pi / 180)
}
