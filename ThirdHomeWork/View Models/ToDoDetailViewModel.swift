//
//  ToDoDetailViewModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/20/22.
//

import Foundation
import CoreData

class ToDoDetailViewModel {
    
    // Define the NSManagedObjectContext for make CoreData process. This object will come from view controller we don't use UIKit inside of view model
    let context:NSManagedObjectContext
    var toDoObject:ToDoListItem!
    
    // Selected object id come from table view helper class to find which object clicked by user and show it in detail view controlelr
    var selectedId:NSManagedObjectID?
    
    
    init(context:NSManagedObjectContext, itemId: NSManagedObjectID) {
        self.context = context
        self.selectedId = itemId
    }
    
    // Get item by id
    func getItems(){
        do {
            toDoObject = try context.existingObject(with: selectedId!) as? ToDoListItem
        } catch {
            
        }
    }
    
    // When user change the description and clicked the done button change the text and also Done picture 
    func changeItem(object:ToDoListItem, newDescription:String, isDone:Bool){
        object.noteDescription = newDescription
        object.isDone = isDone
        do {
            try context.save()
        } catch  {
            
        }
    }
    
    
}
