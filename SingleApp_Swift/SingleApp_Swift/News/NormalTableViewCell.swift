//
//  NormalTableViewCell.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/12.
//

import SnapKit
import UIKit

@objc public protocol NormalTableViewCellDelegate: NSObjectProtocol {
    func tableViewCell(_ tableViewcell: UITableViewCell, clickDeleteButton deleteButton: UIButton)
}

class NormalTableViewCell: UITableViewCell {
    open weak var delegate: NormalTableViewCellDelegate?

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
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        contentView.addSubview(sourceLabel)
        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(100)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.contentView).offset(150)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        contentView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        contentView.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.right.equalTo(self.imageV.snp.left).offset(-15)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
    }

    public func layoutTableViewCell() {
        titleLabel.text = "极客时间iOS开发"
        sourceLabel.text = "极客时间"
        sourceLabel.sizeToFit()
        commentLabel.text = "1888评论"
        commentLabel.sizeToFit()
        commentLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.sourceLabel.snp.right).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        timeLabel.text = "三分钟前"
        timeLabel.sizeToFit()
        timeLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.contentView).offset(80)
            make.left.equalTo(self.commentLabel.snp.right).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        imageV.image = UIImage(named: "icon.bundle/icon.png")
    }

    @objc private func deleteButtonClick() {
        if delegate != nil {
            delegate?.tableViewCell(self, clickDeleteButton: deleteButton)
        }
    }

    // MARK: - lazy load

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .black
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

    private lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.backgroundColor = .blue
        deleteButton.setTitle("X", for: .normal)
        deleteButton.setTitle("V", for: .highlighted)
        deleteButton.addTarget(self, action: #selector(deleteButtonClick), for: .touchUpInside)
        return deleteButton
    }()
}
