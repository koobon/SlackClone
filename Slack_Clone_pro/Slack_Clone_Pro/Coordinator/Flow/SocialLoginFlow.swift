//
//  SocialLoginFlow.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/15.
//

import Foundation
import RxFlow


class SocialLoginFlow: Flow {
  
    var root: Presentable{
        return self.rootViewController
    }
    
    
    private let rootViewController: UINavigationController
    
    init(root: UINavigationController) {
        self.rootViewController = root
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else {
            return .none
        }
        
        switch step {
        case .socialLoginIsRequired:
            return presentToSocialLoginVC()
        case .swipeSocialLoginView:
            self.rootViewController.presentedViewController?.dismiss(animated: false, completion: nil)
            return .none
        default:
            return .none
        }
    }
    func presentToSocialLoginVC() -> FlowContributors{
      
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SocialLoginVC") as? SocialLoginVC else {
            return .none
        }
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        self.rootViewController.present(vc: vc, completion: nil)
        
        return .one(flowContributor: .contribute(withNext: vc))
    }

    
}
