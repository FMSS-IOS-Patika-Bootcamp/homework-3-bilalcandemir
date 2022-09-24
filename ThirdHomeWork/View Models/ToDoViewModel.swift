//
//  ToDoViewModel.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/19/22.
//

import Foundation
import CoreData

class ToDoViewModel {
    
    // Define the NSManagedObjectContext for make CoreData process. This object will come from view controller we don't use UIKit inside of view model
    let context:NSManagedObjectContext
    var toDoArray = [ToDoListItem]()
    
    // Create sorted array for list todos with date
    var sortedArray = [ToDoListItem]()
    
    // App delegate will come from view controller
    init(context:NSManagedObjectContext) {
        self.context = context
    }
    
    // Get todo items
    func getItems(){
        do {
            toDoArray = try context.fetch(ToDoListItem.fetchRequest())
            // List sorted by date
            sortedArray = toDoArray.sorted( by: {$0.date > $1.date} )
        } catch {
        }
    }
}
