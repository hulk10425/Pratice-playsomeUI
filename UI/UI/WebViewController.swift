//
//  WebViewController.swift
//  UI
//
//  Created by 陳遵丞 on 2017/8/3.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    
    var containerView: UIView!
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "http://petopia.cc/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        let navController = UINavigationController()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainView = WebViewController(nibName: nil, bundle: nil)
        navController.viewControllers = [mainView]
        appDelegate?.window!.rootViewController = navController
        appDelegate?.window?.makeKeyAndVisible()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backAction))
        
    }
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
}
