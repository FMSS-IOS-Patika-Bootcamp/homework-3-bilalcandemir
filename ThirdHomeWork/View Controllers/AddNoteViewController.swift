//
//  AddNoteViewController.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/19/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteDescriptionTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    
    let addNoteViewModel = AddNoteViewModel(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    var delegate:toDoViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteDescriptionTextView.layer.borderWidth = 1
        noteDescriptionTextView.layer.borderColor = UIColor.blue.cgColor
        noteDescriptionTextView.layer.cornerRadius = 8
        
        addButtonConfigurate()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // When the user fills the fields and tap the add button we will send to view model for add process
        addNoteViewModel.createItem(title: noteTitleTextField.text ?? "", description: noteDescriptionTextView.text ?? "")
        delegate?.didItemAppend()
        self.navigationController?.popViewController(animated: true)
    }
    
    func addButtonConfigurate(){
        addButton.backgroundColor = UIColor.blue
        addButton.titleLabel?.textColor = UIColor.white
        addButton.layer.cornerRadius = 8
    }
}


