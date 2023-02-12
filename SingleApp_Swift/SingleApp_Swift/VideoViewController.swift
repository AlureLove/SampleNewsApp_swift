//
//  VideoViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/9.
//

import UIKit

class VideoViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "视频"
        tabBarItem.image = UIImage(named: "icon.bundle/video@2x.png")
        tabBarItem.selectedImage = UIImage(named: "icon.bundle/video_selected@2x.png")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: (view.frame.size.width - 10) / 2, height: 300)

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: UICollectionViewCell.description())

        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension VideoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.description(), for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension VideoViewController: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDelegateFlowLayout

extension VideoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 3 == 0 {
            return CGSize(width: view.frame.size.width, height: 150)
        } else {
            return CGSize(width: (view.frame.size.width - 10) / 2, height: 300)
        }
    }
}
