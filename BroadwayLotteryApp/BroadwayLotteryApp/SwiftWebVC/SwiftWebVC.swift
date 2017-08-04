//
//  SwiftWebVC.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import WebKit
import SwiftKeychainWrapper

public protocol SwiftWebVCDelegate: class {
    func didStartLoading()
    func didFinishLoading(success: Bool)
}

public class SwiftWebVC: UIViewController {
    
    public weak var delegate: SwiftWebVCDelegate?
    var storedStatusColor: UIBarStyle?
    var buttonColor: UIColor? = nil
    var titleColor: UIColor? = nil
    var closing: Bool! = false
    
    lazy var backBarButtonItem: UIBarButtonItem =  {
        var tempBackBarButtonItem = UIBarButtonItem(image: SwiftWebVC.bundledImage(named: "SwiftWebVCBack"),
                                                    style: UIBarButtonItemStyle.plain,
                                                    target: self,
                                                    action: #selector(SwiftWebVC.goBackTapped(_:)))
        tempBackBarButtonItem.width = 18.0
        tempBackBarButtonItem.tintColor = self.buttonColor
        return tempBackBarButtonItem
    }()
    
    lazy var forwardBarButtonItem: UIBarButtonItem =  {
        var tempForwardBarButtonItem = UIBarButtonItem(image: SwiftWebVC.bundledImage(named: "SwiftWebVCNext"),
                                                       style: UIBarButtonItemStyle.plain,
                                                       target: self,
                                                       action: #selector(SwiftWebVC.goForwardTapped(_:)))
        tempForwardBarButtonItem.width = 18.0
        tempForwardBarButtonItem.tintColor = self.buttonColor
        return tempForwardBarButtonItem
    }()
    
    lazy var refreshBarButtonItem: UIBarButtonItem = {
        var tempRefreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh,
                                                       target: self,
                                                       action: #selector(SwiftWebVC.reloadTapped(_:)))
        tempRefreshBarButtonItem.tintColor = self.buttonColor
        return tempRefreshBarButtonItem
    }()
    
    lazy var stopBarButtonItem: UIBarButtonItem = {
        var tempStopBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop,
                                                    target: self,
                                                    action: #selector(SwiftWebVC.stopTapped(_:)))
        tempStopBarButtonItem.tintColor = self.buttonColor
        return tempStopBarButtonItem
    }()
    
    lazy var actionBarButtonItem: UIBarButtonItem = {
        var tempActionBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action,
                                                      target: self,
                                                      action: #selector(SwiftWebVC.actionButtonTapped(_:)))
        tempActionBarButtonItem.tintColor = self.buttonColor
        return tempActionBarButtonItem
    }()
    
    
    lazy var webView: WKWebView = {
        var tempWebView = WKWebView(frame: UIScreen.main.bounds)
        tempWebView.uiDelegate = self
        tempWebView.navigationDelegate = self
        return tempWebView;
    }()
    
    var request: URLRequest!
    
    var navBarTitle: UILabel!
    
    ////////////////////////////////////////////////
    
    deinit {
        webView.stopLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        webView.uiDelegate = nil;
        webView.navigationDelegate = nil;
    }
    
    public convenience init(urlString: String) {
        self.init(pageURL: URL(string: urlString)!)
    }
    
    public convenience init(pageURL: URL) {
        self.init(aRequest: URLRequest(url: pageURL))
    }
    
    public convenience init(aRequest: URLRequest) {
        self.init()
        self.request = aRequest
    }
    
    func loadRequest(_ request: URLRequest) {
        webView.load(request)
    }
    
    ////////////////////////////////////////////////
    // View Lifecycle
    
    override public func loadView() {
        view = webView
        loadRequest(request)
       // print(webView.url as Any)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        updateToolbarItems()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        assert(self.navigationController != nil, "SVWebViewController needs to be contained in a UINavigationController. If you are presenting SVWebViewController modally, use SVModalWebViewController instead.")
        
        navBarTitle = UILabel()
        navBarTitle.backgroundColor = UIColor.clear
        if presentingViewController == nil {
            if let titleAttributes = navigationController!.navigationBar.titleTextAttributes {
                navBarTitle.textColor = titleAttributes["NSColor"] as! UIColor
            }
        }
        else {
            navBarTitle.textColor = self.titleColor
        }
        navBarTitle.shadowOffset = CGSize(width: 0, height: 1);
        navBarTitle.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        navBarTitle.textAlignment = .center
        navigationItem.titleView = navBarTitle;
        
        super.viewWillAppear(true)
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            self.navigationController?.setToolbarHidden(false, animated: false)
        }
        else if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    ////////////////////////////////////////////////
    // Toolbar
    
    func updateToolbarItems() {
        backBarButtonItem.isEnabled = webView.canGoBack
        forwardBarButtonItem.isEnabled = webView.canGoForward
        
        if navigationController != nil{
            let refreshStopBarButtonItem: UIBarButtonItem = webView.isLoading ? stopBarButtonItem : refreshBarButtonItem
            
            let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
            let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            
            if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
                
                let toolbarWidth: CGFloat = 250.0
                fixedSpace.width = 35.0
                
                let items: NSArray = [fixedSpace, refreshStopBarButtonItem, fixedSpace, backBarButtonItem, fixedSpace, forwardBarButtonItem, fixedSpace, actionBarButtonItem]
                
                let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: toolbarWidth, height: 44.0))
                if !closing {
                    toolbar.items = items as? [UIBarButtonItem]
                    if presentingViewController == nil {
                        toolbar.barTintColor = navigationController!.navigationBar.barTintColor
                    }
                    else {
                        toolbar.barStyle = navigationController!.navigationBar.barStyle
                    }
                    toolbar.tintColor = navigationController!.navigationBar.tintColor
                }
                navigationItem.rightBarButtonItems = items.reverseObjectEnumerator().allObjects as? [UIBarButtonItem]
                
            }
            else {
                let items: NSArray = [fixedSpace, backBarButtonItem, flexibleSpace, forwardBarButtonItem, flexibleSpace, refreshStopBarButtonItem, flexibleSpace, actionBarButtonItem, fixedSpace]
                
                if !closing {
                    if presentingViewController == nil {
                        navigationController!.toolbar.barTintColor = navigationController!.navigationBar.barTintColor
                    }
                    else {
                        navigationController!.toolbar.barStyle = navigationController!.navigationBar.barStyle
                    }
                    navigationController!.toolbar.tintColor = navigationController!.navigationBar.tintColor
                    toolbarItems = items as? [UIBarButtonItem]
                }
            }
        }
    }
    
    
    ////////////////////////////////////////////////
    // Target Actions
    
    func goBackTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    func goForwardTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    func reloadTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    func stopTapped(_ sender: UIBarButtonItem) {
        webView.stopLoading()
        updateToolbarItems()
    }
    
    func actionButtonTapped(_ sender: AnyObject) {
        
        if let url: URL = ((webView.url != nil) ? webView.url : request.url) {
            let activities: NSArray = [SwiftWebVCActivitySafari(), SwiftWebVCActivityChrome()]
            
            if url.absoluteString.hasPrefix("file:///") {
                let dc: UIDocumentInteractionController = UIDocumentInteractionController(url: url)
                dc.presentOptionsMenu(from: view.bounds, in: view, animated: true)
            }
            else {
                let activityController: UIActivityViewController = UIActivityViewController(activityItems: [url], applicationActivities: activities as? [UIActivity])
                
                if floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1 && UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
                    let ctrl: UIPopoverPresentationController = activityController.popoverPresentationController!
                    ctrl.sourceView = view
                    ctrl.barButtonItem = sender as? UIBarButtonItem
                }
                
                present(activityController, animated: true, completion: nil)
            }
        }
    }
    
    ////////////////////////////////////////////////
    
    func doneButtonTapped() {
        closing = true
        UINavigationBar.appearance().barStyle = storedStatusColor!
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Class Methods

    /// Helper function to get image within SwiftWebVCResources bundle
    ///
    /// - parameter named: The name of the image in the SwiftWebVCResources bundle
    class func bundledImage(named: String) -> UIImage? {
        let image = UIImage(named: named)
        if image == nil {
            return UIImage(named: named, in: Bundle(for: SwiftWebVC.classForCoder()), compatibleWith: nil)
        } // Replace MyBasePodClass with yours
        return image
    }
    
}

extension SwiftWebVC: WKUIDelegate {
    
    // Add any desired WKUIDelegate methods here: https://developer.apple.com/reference/webkit/wkuidelegate
    
}

extension SwiftWebVC: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.delegate?.didStartLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        updateToolbarItems()
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.delegate?.didFinishLoading(success: true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        webView.evaluateJavaScript("document.title", completionHandler: {(response, error) in
            self.navBarTitle.text = response as! String?
            self.navBarTitle.sizeToFit()
            self.updateToolbarItems()
        })
        
        autofill()
    }
    
    
    //function to autofill user information in lottery entry forms
    public func autofill(){
        //only autofill is autofill setting is on
        
       // if UserDefaults.standard.bool(forKey: Constants.UserDefaults.autofillOn) == true {
            //get user info from key chain
            let firstNameTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.firstName)
            let lastNameTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.lastName)
            let zipCodeTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.zipCode)
            let ageTemp: Int? = KeychainWrapper.standard.integer(forKey: Constants.Keychain.userAge)
            let emailTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.email)
            let numberTicketsTemp: Int? = KeychainWrapper.standard.integer(forKey: Constants.Keychain.numberTickets)
            let birthMonthTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthMonth)
            let birthDateTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthDate)
            let birthYearTemp: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthYear)
            
            //only fills out info user has inputted
            if let url = webView.url, let firstName = firstNameTemp, let lastName = lastNameTemp, let zipCode = zipCodeTemp, let age = ageTemp, let email = emailTemp, let numberTickets = numberTicketsTemp, let birthMonth = birthMonthTemp, let birthDate = birthDateTemp, let birthYear = birthYearTemp{
                
                let urlString = String(describing: url)
                print(urlString)
                if urlString == Constants.LotteryURLs.bookOfMoromonURL || urlString == Constants.LotteryURLs.groundhogDayURL || urlString == Constants.LotteryURLs.kinkyBootsURL{
                    
                    webView.evaluateJavaScript("document.getElementById('firstname').value = '\(firstName)'; document.getElementById('lastname').value = '\(lastName)'; document.getElementById('email').value = '\(email)'; document.getElementById('zipcode').value = '\(zipCode)'; document.getElementById('age').value = '\(age)'; if(\(numberTickets) == '2'){document.getElementById('two_tickets').checked = true;} else{document.getElementById('one_ticket').checked = true;} ") { (result, error) in
                        guard error == nil else{
                            print ("Error executing JS")
                            return
                        }
                    }
                }
                
                if urlString.hasPrefix(Constants.LotteryURLs.broadwayDirectEntry){
                    //https://lottery.broadwaydirect.com/enter-lottery/success/?lottery=251089&window=popup&target=to
                    print("bway direct")
                    webView.evaluateJavaScript("document.getElementById('dlslot_name_first').value = '\(firstName)'; document.getElementById('dlslot_name_last').value = '\(lastName)'; document.getElementById('dlslot_email').value = '\(email)'; document.getElementById('dlslot_dob_month').value = '\(birthMonth)'; document.getElementById('dlslot_dob_day').value = '\(birthDate)'; document.getElementById('dlslot_dob_year').value = '\(birthYear)'; document.getElementById('dlslot_zip').value = '\(zipCode)'; if(\(numberTickets) == 2){ document.getElementById('dlslot_ticket_qty').options[2].selected = true; }else{ document.getElementById('dlslot_ticket_qty').options[1].selected = true;}"){ (result, error) in
                        guard error == nil else{
                            print ("Error executing JS")
                            print(error! as Any)
                            return
                        }
                    }
                }
            }
       // }
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.delegate?.didFinishLoading(success: false)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        updateToolbarItems()
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        
        let url = navigationAction.request.url
        
        let hostAddress = navigationAction.request.url?.host
        print(hostAddress as Any)
        if (navigationAction.targetFrame == nil) {
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.openURL(url!)
            }
        }
        decisionHandler(.allow)
        
        // To connnect app store
        if hostAddress == "itunes.apple.com" {
            if UIApplication.shared.canOpenURL(navigationAction.request.url!) {
                UIApplication.shared.openURL(navigationAction.request.url!)
                decisionHandler(.cancel)
                return
            }
        }
        
        // To connect to Facebook App 
        if hostAddress == "m.facebook.com" {
            print("clicked facebook link")
//            print(navigationAction.request.url! as Any)
//            
//            //check if fb app installed 
//            let fbInstalled = schemeAvailable(scheme: "fb://")
//            if fbInstalled{
//                let facebookURL = String(describing: navigationAction.request.url!)
//                let appURLString = facebookURL.replacingOccurrences(of: "https://", with: "fb://")
//                print(appURLString)
//                if let appURL = URL(string: appURLString){
//                    UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
//                }
//            }
            
//            func open(scheme: String) {
//                if let url = URL(string: scheme) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: {
//                        (success) in
//                        print("Open \(scheme): \(success)")
//                    })
//                }
//            }
//            
//            open(scheme: "twitter://timeline")
            //if so open in fb app
        }
        
        
        
        let url_elements = url!.absoluteString.components(separatedBy: ":")
        
        switch url_elements[0] {
        case "tel":
            openCustomApp(urlScheme: "telprompt://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        case "sms":
            openCustomApp(urlScheme: "sms://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        case "mailto":
            openCustomApp(urlScheme: "mailto://", additional_info: url_elements[1])
            decisionHandler(.cancel)
            
        default:
            print("Default")
        }
        
        decisionHandler(.allow)
        
    }
    
    func schemeAvailable(scheme: String) -> Bool {
        if let url = URL(string: scheme) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func openCustomApp(urlScheme: String, additional_info:String){
        
        if let requestUrl: URL = URL(string:"\(urlScheme)"+"\(additional_info)") {
            let application:UIApplication = UIApplication.shared
            if application.canOpenURL(requestUrl) {
                application.openURL(requestUrl)
            }
        }
    }
}
