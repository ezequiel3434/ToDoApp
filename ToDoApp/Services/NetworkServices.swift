//
//  NetworkServices.swift
//  ToDoApp
//
//  Created by Ezequiel Parada Beltran on 26/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import Foundation


class NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    
    
    func getTodos() {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            debugPrint(data)
        }
        task.resume()
    }
    
    func addTodo(todo: Todo){
        
    }
}
