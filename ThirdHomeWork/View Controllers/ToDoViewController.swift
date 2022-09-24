//
//  ToDoViewController.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import UIKit

protocol toDoViewControllerProtocol{
    func didItemAppend()
}

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var toDoTableView: UITableView!
    var items:[ToDoListItem] = []
    
    let toDoViewModel = ToDoViewModel(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    private var tableViewHelper:TableViewHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Yapılacaklar"
        
        // Get sorted items from view model
        toDoViewModel.getItems()
        items = toDoViewModel.sortedArray
        
        // create table view helper
        tableViewHelper = .init(tableView: toDoTableView, vc: self, itemsArray: items, cellIdentifier: ToDoTableViewCell.identifier)
    }
    
    // This screen's navigation bar doesen't show but in the second screen, navigation bar will be show
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        // This delegate give information view model to view controller. When user add a new to do this protocol will enable and when user back to view controller new to do will be added.
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ToDoViewController:toDoViewControllerProtocol{
    func didItemAppend() {
        // Get new items
        toDoViewModel.getItems()
        tableViewHelper.itemsArray = toDoViewModel.sortedArray
        DispatchQueue.main.async {
            self.tableViewHelper.tableView?.reloadData()
        }
    }
}


