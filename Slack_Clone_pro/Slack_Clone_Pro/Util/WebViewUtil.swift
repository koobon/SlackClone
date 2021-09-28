import Foundation
import UIKit
import WebKit

class WebViewUtil {
	
	static func decidePolicyForNavigationAction(_ webView: WKWebView, navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> ())) {
		
		guard let url = navigationAction.request.url else {
			decisionHandler(WKNavigationActionPolicy.cancel)
			return
			
		}
		
		let urlString = url.absoluteString
		let urlScheme = url.scheme ?? ""
		
		let marketRx = NSRegularExpression.rx("\\/\\/itunes\\.apple\\.com\\/")!
		
		if marketRx.isMatch(matchee: urlString as NSString) {
			UIApplication.shared.open(url)
			decisionHandler(.cancel)
		} else if urlString.hasPrefix("about:") {
			decisionHandler(.cancel)
		} else if !EQUALS(urlScheme, "http") && !EQUALS(urlScheme, "https") {
			UIApplication.shared.open(url)
			decisionHandler(.cancel)
		} else {
			decisionHandler(.allow)
		}
	}
}
