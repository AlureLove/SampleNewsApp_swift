//
//  DetailViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/12.
//

import SnapKit
import UIKit
import WebKit

class DetailViewController: UIViewController {
    private var webView: WKWebView?

    private var progressView: UIProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview({
            self.webView = WKWebView(frame: CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height - 88))
            self.webView?.navigationDelegate = self
            return self.webView!
        }())

        webView?.load(URLRequest(url: URL(string: "https://time.geekbang.org")!))

        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)

        view.addSubview({
            self.progressView = UIProgressView(frame: CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: 20))

            return self.progressView!
        }())

//        self.view.addSubview(self.webView)
//        self.webView.snp.makeConstraints { make in
//            make.left.right.bottom.equalTo(self.view)
//            make.top.equalTo(self.view).offset(88)
//        }
//
//        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }

//    lazy private var webView: WKWebView = {
//        let webView = WKWebView()
//        webView.navigationDelegate = self
//        webView.load(URLRequest(url: URL(string: "https://time.geekbang.org")!))
//        return webView
//    }()

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        progressView?.progress = Float(webView!.estimatedProgress)
    }

    deinit {
        self.webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("")
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
}
