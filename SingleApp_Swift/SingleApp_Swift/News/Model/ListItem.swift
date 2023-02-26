//
//  ListItem.swift
//  SingleApp_Swift
//
//  Created by liuruixuan on 2023/2/14.
//

import Foundation

/// model
struct ListItem: Codable {
    var reason: String?
    var error_code: Int = 0
    var result: ListItemResult?
}

struct ListItemResult: Codable {
    var stat: String?
    var data: [ListItemResultData]?
}

struct ListItemResultData: Codable {
    var uniquekey: String?
    var title: String?
    var date: String?
    var category: String?
    var author_name: String?
    var url: String?
    var thumbnail_pic_s: String?
    var thumbnail_pic_s02: String?
    var thumbnail_pic_s03: String?
}
