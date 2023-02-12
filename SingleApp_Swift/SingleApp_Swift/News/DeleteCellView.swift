//
//  DeleteCellView.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/12.
//

import SnapKit
import UIKit

class DeleteCellView: UIView {
    public var clickBlock = { () in
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        addSubview(deleteButton)
//        self.deleteButton.snp.makeConstraints { make in
//            make.top.left.equalTo(self)
//            make.width.equalTo(0)
//            make.height.equalTo(0)
//        }
    }

    @objc private func _clickButton() {
        clickBlock()
        removeFromSuperview()
    }

    public func showDeleteView(From point: CGPoint, _ clickBlock: @escaping () -> Void) {
        deleteButton.frame = CGRect(x: point.x, y: point.y, width: 0, height: 0)
        self.clickBlock = clickBlock

        if #available(iOS 13, *) {
            UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.addSubview(self)

//            self.setNeedsUpdateConstraints()
//            UIView.animate(withDuration: 1.0) {
//                self.deleteButton.snp.remakeConstraints { make in
//                    make.top.equalTo(self).offset((self.bounds.size.height - 200) / 2)
//                    make.left.equalTo(self).offset((self.bounds.size.width - 200) / 2)
//                    make.width.equalTo(200)
//                    make.height.equalTo(200)
//                }
//                self.layoutIfNeeded()
//            }

            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
//                self.deleteButton.snp.remakeConstraints { make in
//                    make.top.equalTo(self).offset((self.bounds.size.height - 200) / 2)
//                    make.left.equalTo(self).offset((self.bounds.size.width - 200) / 2)
//                    make.width.equalTo(200)
//                    make.height.equalTo(200)
//                }
//                self.layoutIfNeeded()
                self.deleteButton.frame = CGRect(x: (self.bounds.size.width - 200) / 2, y: (self.bounds.size.height - 200) / 2, width: 200, height: 200)
            } completion: { finished in
                if finished {
                    print("")
                }
            }
        }
    }

    @objc private func dismissDeleteView() {
        removeFromSuperview()
    }

    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.5
        backgroundView.addGestureRecognizer({
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDeleteView))
            return tapGesture
        }())
        return backgroundView
    }()

    private lazy var deleteButton: UIButton = {
        let deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        deleteButton.backgroundColor = .blue
        deleteButton.addTarget(self, action: #selector(_clickButton), for: .touchUpInside)
        return deleteButton
    }()
}
