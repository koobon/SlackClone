//
//  XibView.swift
//  Pay Manager
//
//  Created by swany on 2020/06/16.
//  Copyright © 2020 Swan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class XibView: UIView {
    
    let disposeBag = DisposeBag.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
