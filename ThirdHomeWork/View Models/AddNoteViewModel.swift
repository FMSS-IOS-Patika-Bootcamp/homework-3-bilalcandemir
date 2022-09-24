//
//  AddNoteViewModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/19/22.
//

import Foundation
import CoreData

class AddNoteViewModel {
    
    // Define the NSManagedObjectContext for make CoreData process. This object will come from view controller we don't use UIKit inside of view model
    let context:NSManagedObjectContext
    init(context:NSManagedObjectContext) {
        self.context = context
    }
    
    // Create item here and save to core data
    func createItem(title:String, description:String){
        let newItem = ToDoListItem(context: context)
        newItem.noteTitle = title
        newItem.noteDescription = description
        newItem.isDone = false
        newItem.date = Date()
        do {
            try context.save()
        } catch {
            
        }
    }
}
