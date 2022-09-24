//
//  PostsViewController.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let postsViewModel = PostsViewModel()
    private var tableViewHelper:TableViewHelper!
    var myArray:[PostsCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsViewModel.viewDelegate = self
        postsViewModel.genericDataFetch()
    }
    
    // Create table view using table view helper class
    func initTableView(){
        tableViewHelper = .init(tableView: mainTableView, vc: self, itemsArray: myArray, cellIdentifier: PostsTableViewCell.identifier)
    }
}


extension PostsViewController:PostsViewDelegate {
    // When network finish fetch process we will come here
    func didCellItemFetch(_ items: [PostsCellViewModel]) {
        myArray = items
        DispatchQueue.main.async {
            // We create table view because we have to left background thread
            self.initTableView()
            // We refresh table view data because we have to left background thread
            self.tableViewHelper.tableView?.reloadData()
        }
    }
}

