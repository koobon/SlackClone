import Foundation
import UIKit

extension UIViewController {

    //뷰컨트롤러를 현재의 스택에 푸시 그렇지 못한경우 새롭게 스택생성
    func pushViewControllerUpsertedCurrentStack(_ animated: Bool) {
        VCStackUtil.pushViewControllerUpsertedCurrentStack(self, animated)
    }
	//네비게이션의 첫번째 viewcontroller가 optional일 경우 예외처리
	func pushViewcontroller(vc: UIViewController?, _ animated: Bool) {
		
		guard let nextVC = vc  else {
			return
		}
		
		self.navigationController?.pushViewcontroller(vc: nextVC, animated)
	}
}

extension UINavigationController {
	
	func pushToVc(vc: UIViewController?) {
		guard let vc = vc else { return }
		vc.modalTransitionStyle = .crossDissolve
		pushViewController(vc, animated: true)
		
	}
}
