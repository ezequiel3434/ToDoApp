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
    
    
    func getTodos( onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void ) {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                 if let error = error {
                     onError(error.localizedDescription)
                     return
                 }
                 guard let data = data, let response = response as? HTTPURLResponse else {
                        onError("Invalid Data or response")
                        return
                 }
                 
                 do{
                     
                     if response.statusCode == 200 {
                                // parse successful result (todos)
                                                     
                                let items = try JSONDecoder().decode(Todos.self, from: data)
                         onSuccess(items)
                         //Handle success
                                                     
                                                     
                                }else {
                                 // Show error to user
                         let err = try JSONDecoder().decode(ApiError.self, from: data)
                         // Handle error
                        onError(err.message)
                                }
                     
                 }catch{
                     onError(error.localizedDescription)
                 }
                 
                                  
                
            }
            
            
          
            
        }
       
        task.resume()
    }
    
    func addTodo(todo: Todo){
        
    }
}
