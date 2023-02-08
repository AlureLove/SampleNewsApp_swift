//
//  ViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
        self.view .addSubview(view)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pushController))
        
        view.addGestureRecognizer(tapGesture)
    }

    @objc func pushController() {
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = "标题"
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "右侧标题", style: .plain, target: self, action: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

