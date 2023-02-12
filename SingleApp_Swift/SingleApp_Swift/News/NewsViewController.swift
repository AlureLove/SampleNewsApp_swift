//
//  NewsViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/8.
//

import UIKit

class NewsViewController: UIViewController {
    private var tableView: UITableView?

    private var dataArray: Array<Int>?

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "新闻"
        tabBarItem.image = UIImage(named: "icon.bundle/page@2x.png")
        tabBarItem.selectedImage = UIImage(named: "icon.bundle/page_selected@2x.png")
        for i in 0 ... 19 {
            dataArray?.append(i)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tableView = UITableView(frame: view.bounds)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(NormalTableViewCell.classForCoder(), forCellReuseIdentifier: NormalTableViewCell.description())
        view.addSubview(tableView!)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NormalTableViewCell.description(), for: indexPath) as? NormalTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        cell.layoutTableViewCell()
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.title = "\(indexPath.row)"
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension NewsViewController: NormalTableViewCellDelegate {
    func tableViewCell(_ tableViewcell: UITableViewCell, clickDeleteButton deleteButton: UIButton) {
        let deleteView = DeleteCellView(frame: view.bounds)

        let rect: CGRect = tableViewcell.convert(deleteButton.frame, to: nil)

//        guard let indexPath = self.tableView?.indexPath(for: tableViewcell) else { return }

        deleteView.showDeleteView(From: rect.origin) { [weak self] in
//            self!.dataArray?.remove(at: indexPath.row)
//
//            self?.tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
