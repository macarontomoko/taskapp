//
//  Task.swift
//  taskapp
//
//  Created by 黒田智子 on 2021/02/17.
//

import RealmSwift

class Task: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // タイトル
    @objc dynamic var title = ""

    // 内容
    @objc dynamic var contents = ""

    // 日時
    @objc dynamic var date = Date()
    
    // 以下、自分で追加
    // 分類
    @objc dynamic var category = ""
    
    // 以上、自分で追加
    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
