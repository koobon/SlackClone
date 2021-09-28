import Foundation
import UIKit

class CustomCollectionView: UICollectionView {
    
	var reloadDataCompletionBlock: (()->())?
    
    func reloadDataWithCompletion(_ completion:@escaping () -> Void) {
        reloadDataCompletionBlock = completion
        super.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let block = self.reloadDataCompletionBlock {
            block()
			reloadDataCompletionBlock = nil
        }
    }
}
