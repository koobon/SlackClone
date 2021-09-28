import Foundation
import UIKit

extension UICollectionView {

	func setSize(animated: Bool, size: CGSize) {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical //.horizontal
		layout.itemSize = size
		layout.sectionInset = .zero
		layout.minimumLineSpacing = 0.0
		layout.minimumInteritemSpacing = 0.0
		self.setCollectionViewLayout(layout, animated: animated)
		self.collectionViewLayout.invalidateLayout()
	}
}
