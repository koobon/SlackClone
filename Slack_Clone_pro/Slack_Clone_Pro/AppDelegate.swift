//
//  AppDelegate.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/14.
//

import UIKit
import Firebase
import GoogleSignIn
import RxFlow
import RxSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator = FlowCoordinator()
    var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //초기 root viewcontroller 세팅
        if !settingRootVC(){return false}
       
        //Firebase 초기화
//        FirebaseApp.configure()
        
        return true
    }

    func settingRootVC() -> Bool {
        guard let window = self.window else {
            return false
        }
        
        let appFlow = AppFlow()
        let appStepper = OneStepper(withSingleStep: AppStep.introIsRequired)
        self.coordinator.coordinate(flow: appFlow, with: appStepper)
        Flows.use(appFlow,when: .created){ (root) in
            window.rootViewController = root
            window.makeKeyAndVisible()
        }
        return true
    }

    //인증 프로세스가 끝날 때 애플리케이션이 수신하는 URL을 적절히 처리
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

