//
//  ListLoader.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/13.
//

import Alamofire
import UIKit

/// 列表请求
class ListLoader: NSObject {
    static func loadListData(with finishBlock: @escaping (Bool, ListItem?) -> Void) {
        let urlString = "https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json"
        AF.request(urlString, method: .get).validate().responseDecodable(of: ListItem.self) { resp in
            switch resp.result {
            case let .success(model):
                DispatchQueue.main.async {
                    finishBlock(true, model)
                }
                break
            case .failure:
                DispatchQueue.main.async {
                    finishBlock(false, nil)
                }
                break
            }
        }
    }

    // 本来是用于将首次请求的数据存在本地，下次先从本地拿数据作为占位，后真实数据回来后进行替换，但是swift这个文件操作太难写，就先搁置，后续处理
    private func archiveListData(with array: [ListItem]?) {
        let pathArray = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = pathArray.first

        let fileManager = FileManager.default

        guard let dataPath = cachePath?.appending("GTData") else { return }
        try? fileManager.createDirectory(atPath: dataPath, withIntermediateDirectories: true, attributes: nil)

        let listDataPath = dataPath.appending("list")

        let listData = try? NSKeyedArchiver.archivedData(withRootObject: array as Any, requiringSecureCoding: true)

        fileManager.createFile(atPath: listDataPath, contents: listData)
    }
}
