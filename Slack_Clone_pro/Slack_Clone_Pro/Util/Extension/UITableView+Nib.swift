//
//  UITableView+Nib.swift
//  purplay
//
//  Created by sjd on 2017. 12. 14..
//  Copyright © 2017년 sjd. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

protocol CellReusable: class {
    static var reuseIdentifier: String { get }
}

extension CellReusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func regist<T: UITableViewCell>(_: T.Type) {
        let nib = UINib.init(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNibIdentifier(_ identifier: String) {
        let nib: (UINib) = UINib.init(nibName: identifier, bundle: nil);
        self.register(nib, forCellReuseIdentifier: identifier);
    }
}

extension UITableViewCell: CellReusable, NibLoadable {
}
