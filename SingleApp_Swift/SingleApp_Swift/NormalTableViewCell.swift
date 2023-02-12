//
//  NormalTableViewCell.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/12.
//

import UIKit
import SnapKit

class NormalTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(15)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        self.contentView.addSubview(self.sourceLabel)
        self.sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.contentView.addSubview(self.commentLabel)
        self.commentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(100)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(150)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.contentView.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        self.contentView.addSubview(self.deleteButton)
        self.deleteButton.snp.makeConstraints { make in
            make.right.equalTo(self.imageV.snp.left).offset(-15)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
    }
    
    public func layoutTableViewCell() {
        self.titleLabel.text = "极客时间iOS开发"
        self.sourceLabel.text = "极客时间"
        self.sourceLabel.sizeToFit()
        self.commentLabel.text = "1888评论"
        self.commentLabel.sizeToFit()
        self.commentLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.sourceLabel.snp.right).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.timeLabel.text = "三分钟前"
        self.timeLabel.sizeToFit()
        self.timeLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.commentLabel.snp.right).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        
        self.imageV.image = UIImage(named: "icon.bundle/icon.png")
    }
    
    @objc private func deleteButtonClick() {
        print("click")
    }
    
    // MARK - lazy load
    lazy private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy private var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.font = UIFont.systemFont(ofSize: 12)
        sourceLabel.textColor = .gray
        return sourceLabel
    }()
    
    lazy private var commentLabel: UILabel = {
        let commentLabel = UILabel()
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.textColor = .gray
        return commentLabel
    }()
    
    lazy private var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = .gray
        return timeLabel
    }()
    
    lazy private var imageV: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy private var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.backgroundColor = .blue
        deleteButton.setTitle("X", for: .normal)
        deleteButton.setTitle("V", for: .highlighted)
        deleteButton.addTarget(self, action: #selector(deleteButtonClick), for: .touchUpInside)
        return deleteButton
    }()
}
