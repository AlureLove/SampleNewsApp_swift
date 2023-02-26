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
}
