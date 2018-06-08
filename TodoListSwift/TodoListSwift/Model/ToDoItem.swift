//
//  ToDoItem.swift
//  TodoListSwift
//
//  Created by miguel on 6/7/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.itemName = name as NSString
    }
    
}
