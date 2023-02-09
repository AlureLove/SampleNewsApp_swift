//
//  RecommendViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/9.
//

import UIKit

class RecommendViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "推荐"
        self.tabBarItem.image = UIImage(named: "icon.bundle/like@2x.png")
        self.tabBarItem.selectedImage = UIImage(named: "icon.bundle/like_selected@2x.png")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = .lightGray
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width * 5, height: self.view.bounds.size.height)
        scrollView.delegate = self
        
        let colorArray = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green, UIColor.orange]
        
        for i in 0...4 {
            let view = UIView(frame: CGRect(x: scrollView.bounds.size.width * CGFloat(i), y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
            view.backgroundColor = colorArray[i]
            scrollView.addSubview(view)
        }
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
    }
}

extension RecommendViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
