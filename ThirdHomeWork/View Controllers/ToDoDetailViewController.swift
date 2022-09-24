//
//  ToDoDetailViewController.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/20/22.
//

import UIKit
import CoreData

class ToDoDetailViewController: UIViewController {
    
    @IBOutlet weak var toDoTitleLabel: UILabel!
    @IBOutlet weak var toDoDescriptionTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    var listItemId:NSManagedObjectID?
    var delegate:toDoViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDescriptionTextView.layer.borderWidth = 1
        toDoDescriptionTextView.layer.borderColor = UIColor.blue.cgColor
        toDoDescriptionTextView.layer.cornerRadius = 8
        getDataFromViewModel()
        addButtonConfigurate()
        
    }
    
    // This function shows detail of to do list by selected object using object id
    func getDataFromViewModel(){
        let toDoViewModel = ToDoDetailViewModel(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext, itemId: listItemId!)
        toDoViewModel.getItems()
        // Change inside the label and the text view, in this application user can change description but can't change the title
        toDoTitleLabel.text = toDoViewModel.toDoObject.noteTitle
        toDoDescriptionTextView.text = toDoViewModel.toDoObject.noteDescription
    }
    
    func addButtonConfigurate(){
        doneButton.backgroundColor = UIColor.blue
        doneButton.titleLabel?.textColor = UIColor.white
        doneButton.layer.cornerRadius = 8
    }
    
    // When user pressed done button this function call the view model and gives the changes
    @IBAction func doneButtonPressed(_ sender: Any) {
        let toDoViewModel = ToDoDetailViewModel(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext, itemId: listItemId!)
        toDoViewModel.getItems()
        toDoViewModel.changeItem(object: toDoViewModel.toDoObject, newDescription: toDoDescriptionTextView.text, isDone: true)
        delegate?.didItemAppend()
        self.navigationController?.popViewController(animated: true)
    }
    
}
