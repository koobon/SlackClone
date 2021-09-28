//
//  UICollectionView+Cells.swift
//  forenaiottmp
//
//  Created by swany on 2020/11/04.
//  Copyright © 2020 Taesung Kim. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func getCells() -> [UICollectionViewCell?] {
        var cells: [UICollectionViewCell?] = []
        
        for i in 0..<self.numberOfSections {
            for j in 0..<self.numberOfItems(inSection: i) {
                let cell = self.cellForItem(at: .init(row: j, section: i))
                cells.append(cell)
            }
        }
        
        return cells
    }
}

extension UITableView {
 
    func getCells() -> [UITableViewCell?] {
        var cells: [UITableViewCell?] = []
        
        for i in 0..<self.numberOfSections {
            for j in 0..<self.numberOfRows(inSection: i) {
                let cell = self.cellForRow(at: .init(row: j, section: i))
                cells.append(cell)
            }
        }
        
        return cells
    }
}
