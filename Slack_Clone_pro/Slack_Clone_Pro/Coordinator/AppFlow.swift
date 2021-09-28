//
//  AppFlow.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/14.
//

import Foundation
import RxFlow

class AppFlow: Flow{
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
       let viewController = UINavigationController()
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        //step에 정의된 내용들을 필요에 따라 추가한다.
        switch step {
        case .introIsRequired:
            return navigateToIntroVC()
        case .socialLoginIsRequired:
            return presentToSocialLogin()
        case .swipeSocialLoginView:
            return .none
        default:
            return .none
        }
    }
    
    func navigateToIntroVC() -> FlowContributors {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
        
        self.rootViewController.pushViewController(vc,animated: true)
        
        return .one(flowContributor: .contribute(withNext: vc))
        
    }
   
    func presentToSocialLogin() -> FlowContributors{
        
        let flow = SocialLoginFlow(root: self.rootViewController)
        let nextStep = OneStepper(withSingleStep: AppStep.socialLoginIsRequired)
        
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: nextStep))
    }
}
