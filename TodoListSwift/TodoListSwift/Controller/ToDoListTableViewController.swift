//
//  ToDoListTableViewController.swift
//  TodoListSwift
//
//  Created by miguel on 6/8/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import UIKit

@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController{
    
    var toDoItems: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - LoadData
    
    func loadInitialData(){
        let item1 = ToDoItem(name: "Comprar leche")
        self.toDoItems.add(item1)
        
        let item2 = ToDoItem(name: "Comprar huevos")
        self.toDoItems.add(item2)
        
        let item3 = ToDoItem(name: "Leer un libro")
        self.toDoItems.add(item3)
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIndentifier: String = "ListPrototypeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIndentifier, for: indexPath)
        let todoitem: ToDoItem = self.toDoItems.object(at: indexPath.row) as! ToDoItem
        cell.textLabel?.text = todoitem.itemName as String
        
        if todoitem.completed{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let tappedItem: ToDoItem = self.toDoItems.object(at: indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
    
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.source as! AddToDoViewController
        if let item: ToDoItem = source.toDoItem{
            self.toDoItems.add(item)
            self.tableView.reloadData()
        }
    }
    
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     return true
     }
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        //self.toDoItems.remove(indexPath.row)
        //tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
