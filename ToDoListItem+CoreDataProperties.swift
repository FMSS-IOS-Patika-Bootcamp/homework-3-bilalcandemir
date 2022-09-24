//
//  ToDoListItem+CoreDataProperties.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/19/22.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var noteId: UUID?
    @NSManaged public var noteTitle: String?
    @NSManaged public var noteDescription: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var date: Date

}

extension ToDoListItem : Identifiable {

}
