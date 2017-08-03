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

    }
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
