//
//  NewsViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/8.
//

import UIKit

class NewsViewController: UIViewController {
    private var tableView: UITableView?

    private var dataArray: Array<ListItemResultData>?

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "新闻"
        tabBarItem.image = UIImage(named: "icon.bundle/page@2x.png")
        tabBarItem.selectedImage = UIImage(named: "icon.bundle/page_selected@2x.png")
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
        ListLoader.loadListData { [weak self] isSucceed, model in
            if isSucceed {
                self?.dataArray = model?.result?.data
                self?.tableView?.reloadData()
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NormalTableViewCell.description(), for: indexPath) as? NormalTableViewCell else { return UITableViewCell() }

        if dataArray?.count ?? 0 > 0 {
            cell.layoutTableViewCell(with: dataArray![indexPath.row])
        }
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let item = dataArray?[indexPath.row] else { return }

        let controller = DetailViewController(with: item.url ?? "https://time.geekbang.org")
        controller.title = "\(indexPath.row)"
        navigationController?.pushViewController(controller, animated: true)

        if item.uniquekey != nil {
            UserDefaults.standard.set(true, forKey: item.uniquekey!)
        }
    }
}
