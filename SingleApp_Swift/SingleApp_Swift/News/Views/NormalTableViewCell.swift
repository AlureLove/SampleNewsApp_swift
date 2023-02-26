//
//  NormalTableViewCell.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/12.
//

import Kingfisher
import SnapKit
import UIKit

class NormalTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(15)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(270)
            make.height.equalTo(50)
        }
        contentView.addSubview(sourceLabel)
        sourceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView).offset(-10)
            make.left.equalTo(self.contentView).offset(20)
            make.width.lessThanOrEqualTo(80)
            make.height.equalTo(20)
        }
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView).offset(-10)
            make.left.equalTo(self.sourceLabel.snp.right).offset(10)
            make.width.lessThanOrEqualTo(50)
            make.height.equalTo(20)
        }
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView).offset(-10)
            make.left.equalTo(self.commentLabel.snp.right).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
    }

    public func layoutTableViewCell(with itemData: ListItemResultData) {
        if itemData.uniquekey != nil {
            let hasRead = UserDefaults.standard.bool(forKey: itemData.uniquekey!)
            if hasRead {
                titleLabel.textColor = .lightGray
            } else {
                titleLabel.textColor = .black
            }
        }
        titleLabel.text = itemData.title
        sourceLabel.text = itemData.author_name
        commentLabel.text = itemData.category
        timeLabel.text = itemData.date

        // 正确写法应该是 imageV.kf.setImage(with: URL(string: itemData.thumbnail_pic_s))
        // 接口的返回的链接中图片所有的访问地址都已经挂掉，就随便找了个可以用的图片链接代替，这里知道用kf加载网络图片即可
        imageV.kf.setImage(with: URL(string: "http://project.onapp.top:8081/community/head/5.png"))
    }

    // MARK: - lazy load

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        return titleLabel
    }()

    private lazy var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.font = UIFont.systemFont(ofSize: 12)
        sourceLabel.textColor = .gray
        return sourceLabel
    }()

    private lazy var commentLabel: UILabel = {
        let commentLabel = UILabel()
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.textColor = .gray
        return commentLabel
    }()

    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = .gray
        return timeLabel
    }()

    private lazy var imageV: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}
