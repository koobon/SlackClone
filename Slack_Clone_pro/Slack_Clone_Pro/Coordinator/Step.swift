//
//  Step.swift
//  Slack_Clone_Pro
//
//  Created by mobile on 2021/09/14.
//

import Foundation
import RxFlow

//Step: 페이지 전환시 요구되는 조건들을 나열한 것
enum AppStep: Step {
    case introIsRequired //인트로 진입
    case socialLoginIsRequired //소셜로그인 버튼 클릭시
    case swipeSocialLoginView //소셜로그인 뷰를 스와이프 시
}
