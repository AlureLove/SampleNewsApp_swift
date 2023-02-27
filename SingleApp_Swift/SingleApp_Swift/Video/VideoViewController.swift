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
        flowLayout.itemSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.width / 16 * 9)

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(VideoCoverCollectionViewCell.self, forCellWithReuseIdentifier: VideoCoverCollectionViewCell.description())

        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension VideoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCoverCollectionViewCell.description(), for: indexPath) as? VideoCoverCollectionViewCell else { return UICollectionViewCell() }

        cell.layout(with: "videoCover", videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension VideoViewController: UICollectionViewDelegate {
}
