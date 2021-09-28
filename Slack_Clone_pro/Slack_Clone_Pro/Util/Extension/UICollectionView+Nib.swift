import Foundation
import UIKit

extension UICollectionView {
    
    func regist<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib.init(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNibIdentifier(_ identifier: String) {
        let nib: UINib = UINib.init(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}

extension UICollectionViewCell: CellReusable, NibLoadable {
}
