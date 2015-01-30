//
//  FirstViewController.swift
//  To Do List
//
//  Created by Mat Sletten on 10/22/14.
//  Copyright (c) 2014 Mat Sletten. All rights reserved.
//

import UIKit

var toDoItems:[String] = []
//because the array above is declared outside this VC class, it is accessbile by the SecondVC

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var toDoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoItems[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(animated: Bool)
    {
        if var storedToDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoArray")
        {
            toDoItems = []
            for var row = 0; row < storedToDoItems.count; row++
            {
                toDoItems.append(storedToDoItems[row] as NSString)
            }
        }
        
        toDoTable.reloadData()
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            toDoItems.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoArray")
            NSUserDefaults.standardUserDefaults().synchronize()
            toDoTable.reloadData()
        }
    }

}

