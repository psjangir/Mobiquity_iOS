//
//  ViewController.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import UIKit
import WebKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "help", withExtension: "html"){
            webView.loadFileURL(url, allowingReadAccessTo: url)
            let request = URLRequest(url: url as URL)
            webView.load(request)
        }
    }
}

