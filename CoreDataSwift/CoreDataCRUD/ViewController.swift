//
//  ViewController.swift
//  CoreDataCRUD
//
//  Created by Ankur on 7/4/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var username = [String]()
    var email    = [String]()
    var password = [String]()
    var mobile = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func createData(_ sender: Any) {
  
        CoreDataLogic.createData(username: "SABBIR", email: "sabbir@gmail.com", password: "123456")
 
    }
    
    @IBAction func retrieveData(_ sender: Any) {
        username =  CoreDataLogic.retrieveData()
        print( username)
 
    }
    
    @IBAction func updateData(_ sender: Any) {
        
        CoreDataLogic.updateData()
 
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        //CoreDataLogic.deleteAllData()
        CoreDataLogic.deleteDataOne()
 
    }
    
 
    
    
}

