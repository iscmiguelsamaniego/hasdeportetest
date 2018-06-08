//
//  TodoItemR.swift
//  TodoListSwift
//
//  Created by miguel on 6/8/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import RealmSwift

class TodoItemR: Object {
    
    @objc dynamic var itemId: String = UUID().uuidString
    @objc dynamic var body: String = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var timestamp: Date = Date()
    
    override static func primaryKey() -> String? {
        return "itemId"
    }
    
}
