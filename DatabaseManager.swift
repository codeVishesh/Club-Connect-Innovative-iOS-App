//
//  DatabaseManager.swift
//  Club_Connect
//
//  Created by student on 18-04-2024.
//

import Foundation
import UIKit




class DatabaseManager{
    
    func addser(_ user: UserModel){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
           let userEntity = Student(context: context)
        userEntity.name = user.name
        userEntity.email  = user.email
//           userEntity.password = password
           
           
           do{
              try context.save()
           }catch{
               print("user saving err")
           }
        
       
    }
}
