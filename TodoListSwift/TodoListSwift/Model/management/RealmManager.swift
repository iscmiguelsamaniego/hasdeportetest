//
//  RealmManager.swift
//  TodoListSwift
//
//  Created by miguel on 6/8/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import Foundation
import RealmSwift

//ToDo : Please save values and implements aactions for CRUD
class RealmManager: NSObject{
    
    class func list<T: Object>(object: T.Type) -> List<T>?{
        
        let results = try! Realm().objects(object)
        let listResults = List<T>()
        listResults.append(objectsIn: results)
        return listResults
    }
    
    class func clearRealm(){
        
        let realm = try! Realm()
        try! realm.write ({ () -> Void in
            realm.deleteAll()
        })
    }
    
    class func deleteObject<T: Object>(object: T) -> Bool{
        let realm = try! Realm()
        do{
            try realm.write ({ () -> Void in
                realm.delete(object)
            })
            return true
        }catch {
            return false
        }
    }
    
    class func insert<T: Object>(object: T) -> Bool{
        let realm = try! Realm()
        do{
            try realm.write({ () -> Void in
                realm.add(object, update: true)
            })
            return true
        }catch{
            return false
        }
    }
    
    class func append<T: Object>(list: List<T>, object: T) -> Bool{
        let realm = try! Realm()
        do{
            try realm.write({ () -> Void in
                realm.add(object, update: true)
                list.append(object)
            })
            return true
        }catch{
            return false
        }
    }
    
    class func find<T: Object>(object: T.Type, id: String) -> T?{
        let predicate = NSPredicate(format: "itemId = %@", id)
        return try! Realm().objects(object).filter(predicate).first
    }
    
    class func first<T: Object>(object: T.Type) -> T?{
        return try! Realm().objects(object).first
    }
    
}
