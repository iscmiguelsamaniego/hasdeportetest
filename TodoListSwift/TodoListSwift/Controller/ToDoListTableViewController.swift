//
//  ToDoListTableViewController.swift
//  TodoListSwift
//
//  Created by miguel on 6/8/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import UIKit
import RealmSwift

@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController{
    
    var items = List<TodoItemR>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - LoadData
    func loadInitialData(){
        let todoList = RealmManager.list(object: TodoItemR.self)
        for todo in todoList!{
            self.items.append(todo)
        }
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIndentifier: String = "ListPrototypeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIndentifier, for: indexPath)
        
        let todoitem = items[indexPath.row]
        cell.textLabel?.text = todoitem.body
        cell.accessoryType = todoitem.isDone ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let realm = try! Realm()
        try! realm.write {
            let tappedItem = items[indexPath.row]
            tappedItem.isDone = !tappedItem.isDone
            realm.add(tappedItem)
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.source as! AddToDoViewController
        if let item: TodoItemR = source.toDoItem{
            let aux = TodoItemR()
            aux.body = item.body
            
            if RealmManager.insert(object: aux){
                self.items.append(aux)
            }else{
                print("Error on Realm")
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let item = items[indexPath.row]
            if (RealmManager.find(object: TodoItemR.self, id: item.itemId) != nil){
                if RealmManager.deleteObject(object: item){
                    self.items.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    
}
