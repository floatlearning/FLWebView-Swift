import UIKit

extension UIWebView: FLWebViewProvider {

    // A simple convenience initializer, this allows for UIWebView(delegateView:) initialization
    convenience init(delegateView: UIWebViewDelegate) {
        self.init()
        self.delegate = delegateView
    }
    
    // UIWebView has one delegate method so this is pretty straight forward
    func setDelegateViews(viewController: ViewController) {
        delegate = viewController
    }
    
    func canNavigateBackward() -> Bool {
        return self.canGoBack
    }
    
    func canNavigateForward() -> Bool {
        return self.canGoForward
    }
    
    // A quick method for loading requests based on strings in a URL format
    func loadRequestFromString(urlNameAsString: String!) {
        loadRequest(NSURLRequest(URL: NSURL(string: urlNameAsString)!))
    }
    
    func currentURL() -> NSURL? {
        return self.request?.URL
    }
    
    func evaluateJS(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        // Have the WebView evaluate the javascript string
        let string = stringByEvaluatingJavaScriptFromString(javascriptString)
        
        // Call the completion handler from there
        completionHandler(string!, NSError(coder: NSCoder())!)
    }
    
    func setScalesPageToFit(setPages: Bool!) {
        self.scalesPageToFit = setPages
    }
    
}
