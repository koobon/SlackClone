//
//  SocialLoginVC.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class SocialLoginVC: UIViewController, Stepper{
    
    var steps: PublishRelay<Step> = .init()
    
    var disposeBag = DisposeBag()
    //MARK: - Properties
    
    var viewTranslation = CGPoint(x:0, y:0)
    var viewVelocity = CGPoint(x:0,y:0)
    
    @IBOutlet var slideMenuView: UIView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture.rx.event
            .subscribe{ [weak self] _ in
                guard let self = self else { return }
                self.steps.accept(AppStep.swipeSocialLoginView)
            }.disposed(by: disposeBag)
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
      
        viewTranslation = sender.translation(in: self.slideMenuView)
        viewVelocity = sender.velocity(in: self.slideMenuView)
        
        switch sender.state {
        
        case .changed:
            if abs(viewVelocity.y) > abs(viewVelocity.x){
                if viewVelocity.y > 0 {
                    self.slideMenuView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                }
            }
        case .ended:
            if viewTranslation.y < 200 {
                print(viewTranslation.y)
                self.slideMenuView.transform = .identity
            }else{
                self.steps.accept(AppStep.swipeSocialLoginView)
            }
        default:
            break
        }
    }
    
   
    

}
