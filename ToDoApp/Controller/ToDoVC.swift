//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ezequiel Parada Beltran on 25/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ToDoVC: UIViewController {
    @IBOutlet weak var todoItemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getTodos()
        
       
       
    }

    @IBAction func addTodo(_ sender: Any) {
        
        guard let todoItem = todoItemTxt.text else {
            return
        }
        
        let todo = Todo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        NetworkService.shared.addTodo(todo: todo, onSuccess: { (todos) in
            self.todoItemTxt.text = ""
                   self.todos = todos.items
                   self.tableView.reloadData()
               }) { (errorMessage) in
                   // show any error to user to post
                debugPrint(errorMessage)
               }
        prioritySegment.selectedSegmentIndex = 0
    }
    
    func getTodos() {
   
        
        NetworkService.shared.getTodos(onSuccess: { (todos) in
            self.todos = todos.items
            
            self.tableView.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    
    
}

extension ToDoVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as? ToDoCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
