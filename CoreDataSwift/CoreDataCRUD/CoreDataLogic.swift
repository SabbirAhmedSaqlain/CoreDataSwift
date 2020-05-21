//
//  CoreDataOperation.swift
//  CoreDataCRUD
//
//  Created by BS348 on 26/11/19.
//  Copyright © 2019 ankur. All rights reserved.
//

import UIKit
import CoreData

class CoreDataLogic {
    
    
    
    
    
    static func createData(username: String, email: String , password: String){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let userEntity1 = NSEntityDescription.entity(forEntityName: "Information", in: managedContext)!
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        
        for i in 1...3 {
            
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(username + " \(i)", forKeyPath: "username")
            user.setValue(email    + " \(i)", forKey: "email")
            user.setValue(password + " \(i)", forKey: "password")
            
            let user1 = NSManagedObject(entity: userEntity1, insertInto: managedContext)
            user1.setValue("01763978413", forKeyPath: "mobile")
            user1.setValue(email    + " \(i)", forKey: "address")
            
        }
        //Now we have set all the values. The next step is to save them inside the Core Data
        do {
            try managedContext.save()
            print("Data Saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static func retrieveData() -> [String] {
        
        var username = [String]()
        var email    = [String]()
        var password = [String]()
        var mobile = [String]()
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return username }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Information")
        
        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
        //
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                
                if let item1 = data.value(forKey: "username") {
                    username.append(item1 as! String)
                }
                if let item2 = data.value(forKey: "email") {
                    email.append(item2 as! String)
                }
                if let item3 = data.value(forKey: "password") {
                    password.append(item3 as! String)
                }
            }
            
            let result1 = try managedContext.fetch(fetchRequest1)
            for data in result1 as! [NSManagedObject] {
                
                if let item1 = data.value(forKey: "mobile") {
                    mobile.append(item1 as! String)
                }
            }

        } catch {
            
            print("Failed")
        }
        
//        print(username)
//        print(email)
//        print(password)
//        print(mobile)
        
        return username
        
    }
    
    static func updateData(){
 
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        //fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur1")
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            for data in test as! [NSManagedObject] {
                
                if let item1 = data.value(forKey: "username") {
                    data.setValue("Ahmed", forKeyPath: "username")
                    
                }
                if let item2 = data.value(forKey: "email") {
                    data.setValue("abc@gmail.com", forKey: "email")
                }
                if let item3 = data.value(forKey: "password") {
                    data.setValue("654321", forKey: "password")
                }
            }
            
            do{
                try managedContext.save()
                print("Updated")
                
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
        
    }
    
    static func deleteAllData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur3")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do
        {
            try managedContext.execute(deleteRequest)
            try managedContext.save()
            print("Deleted")
        }catch
        {
            print(error)
        }
    }
    
    
    static func deleteDataOne(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur3")
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            if test.count > 0 {
                //let objectToDelete = test[0] as! NSManagedObject
                let objectToDelete = test[test.count - 1] as! NSManagedObject
                managedContext.delete(objectToDelete)
                
            }

            do{
                try managedContext.save()
                print("Deleted")
                
            }
            catch
            {
                print(error)
            }
            
        }
        catch
        {
            print(error)
        }
    }
 
}


