//
//  ViewController.swift
//  TodoListSwift
//
//  Created by miguel on 6/8/18.
//  Copyright © 2018 Samtech. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {  
    
    var toDoItem: TodoItemR?
    
    @IBOutlet weak var newTodoUITextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if !(self.newTodoUITextField.text?.isEmpty)!{
            toDoItem = TodoItemR()
            toDoItem?.body = self.newTodoUITextField.text!            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

