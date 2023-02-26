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

    private var articleUrl: String!

    init(with urlString: String) {
        super.init(nibName: nil, bundle: nil)
        articleUrl = urlString
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview({
            self.webView = WKWebView(frame: CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height - 88))
            self.webView?.navigationDelegate = self
            return self.webView!
        }())

        // 正确写法应该为 webView?.load(URLRequest(url: URL(string: self.articleUrl)!))
        // 由于请求中的url失效，所以这里随便写了个可以跳转的，意思明白即可
        webView?.load(URLRequest(url: URL(string: "https://time.geekbang.org")!))

        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)

        view.addSubview({
            self.progressView = UIProgressView(frame: CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: 20))

            return self.progressView!
        }())
    }

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
