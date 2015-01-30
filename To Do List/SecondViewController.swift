//
//  SecondViewController.swift
//  To Do List
//
//  Created by Mat Sletten on 10/22/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //var toDoItems:[String] = []
    //using [] initializes an array as empty while :[String] indicates what type will be in the array.
    
    @IBOutlet weak var newItemText: UITextField!
    
    @IBAction func addButtonPressed(sender: AnyObject)
    {
        toDoItems.append(newItemText.text)
        //Xcode 6 can store mutable arrays and immutable arrays. No need to set a let equal to a mutable array in order to store immutable array in NSUser Defaults
        NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoArray")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //var storedToDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoArray")
        
        //println(storedToDoItems)
        self.view.endEditing(true)
        //println(toDoItems)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        newItemText.resignFirstResponder()
        return true
    }

    
}

