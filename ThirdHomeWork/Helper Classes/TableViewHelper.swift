//
//  TableViewHelper.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import Foundation
import UIKit

// This class is master piece which created by Bilal Candemir. Anyway so this is generic Table View Helper Class.
class TableViewHelper:NSObject {
    
    // We have a table view, view controller, items array is defined any because we created table view cell different 2 view controllers and also we have a cell identifier because we will use 2 different custom table view cell
    var tableView:UITableView?
    var viewController:UIViewController?
    var itemsArray = [Any]()
    var cellIdentifier:String?
    
    // Use init when create a new table view
    init(tableView: UITableView, vc: UIViewController, itemsArray: [Any], cellIdentifier: String){
        super.init()
        self.tableView = tableView
        self.viewController = vc
        self.itemsArray = itemsArray
        self.cellIdentifier = cellIdentifier
        configureTableView(cellIdentifier)
    }
    
    // Table view configuration when user wants to create table view cell with custom cells
    private func configureTableView(_ identifier:String) {
        tableView?.register(.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}


extension TableViewHelper:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Give the items array count
        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Casting process for understand which array come from view model and create the custom cell
        if let postsArray = itemsArray as? [PostsCellViewModel] {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier) as! PostsTableViewCell
            cell.setData(item: postsArray[indexPath.row])
            return cell
        }
        
        //Casting process for understand which array come from view model and create the custom cell
        if let toDoListArray = itemsArray as? [ToDoListItem] {
            let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier) as! ToDoTableViewCell
            cell.setData(item: toDoListArray[indexPath.row])
            return cell
        }
        
        
        let cell = UITableViewCell()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Check the items array, we just use did select row at func at to Do View controller
        if let toDoListArray = itemsArray as? [ToDoListItem] {
            // Prepare process for navigate to detail view controller
            let storyboard = UIStoryboard(name: "ToDoStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ToDoDetailViewController") as! ToDoDetailViewController
            
            // Give the object id for find which item come. If you want you can also this situation with just change the label and body values inside the class but i don't want it this is more complex
            vc.listItemId = toDoListArray[indexPath.row].objectID
            vc.delegate = viewController.self as? toDoViewControllerProtocol
            
            // Go to detail view controller
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
