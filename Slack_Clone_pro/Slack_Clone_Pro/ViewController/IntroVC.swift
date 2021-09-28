//
//  ViewController.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/14.
//

import UIKit
import RxFlow
import RxCocoa
import RxSwift
import Reusable
class IntroVC: UIViewController ,Stepper, StoryboardBased {

    var steps: PublishRelay<Step> = .init()
    //햅틱 모션
    var feedbackGenerator: UIImpactFeedbackGenerator?
    @IBOutlet var btnLogin: UIButton!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //로그인 버튼 클릭 시 이벤트
        self.btnLogin.rx.tap
            .subscribe{ [weak self] _ in
                guard let self = self else { return }
                //햅팁 모션 추가
                self.feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                self.feedbackGenerator?.impactOccurred()
                self.steps.accept(AppStep.socialLoginIsRequired)
            }.disposed(by: disposeBag)
        
    }
    
}

