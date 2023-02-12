//
//  ViewController.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/8.
//

import UIKit

class ViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.register(NormalTableViewCell.classForCoder(), forCellReuseIdentifier: NormalTableViewCell.description())
        self.view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NormalTableViewCell.description(), for: indexPath) as? NormalTableViewCell else { return UITableViewCell() }
        
        cell.layoutTableViewCell()
//        cell.textLabel?.text = "主标题 - \(indexPath.row)"
//        cell.detailTextLabel?.text = "副标题"
//        cell.imageView?.image = UIImage(named: "icon.bundle/video@2x.png")
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIViewController()
        controller.title = "\(indexPath.row)"
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


