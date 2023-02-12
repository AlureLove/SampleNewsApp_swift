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
        tabBarItem.title = "推荐"
        tabBarItem.image = UIImage(named: "icon.bundle/like@2x.png")
        tabBarItem.selectedImage = UIImage(named: "icon.bundle/like_selected@2x.png")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .lightGray
        scrollView.contentSize = CGSize(width: view.bounds.size.width * 5, height: view.bounds.size.height)
        scrollView.delegate = self

        let colorArray = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green, UIColor.orange]

        for i in 0 ... 4 {
            let view = UIView(frame: CGRect(x: scrollView.bounds.size.width * CGFloat(i), y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
            view.addSubview({
                let subView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
                subView.backgroundColor = .yellow
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClick))
                view.addGestureRecognizer(tapGesture)
                return subView
            }())
            view.backgroundColor = colorArray[i]
            scrollView.addSubview(view)
        }
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
    }

    @objc private func viewClick() {
        print("view click")
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
