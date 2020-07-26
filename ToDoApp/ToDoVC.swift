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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addTodo(_ sender: Any) {
    }
    
}

