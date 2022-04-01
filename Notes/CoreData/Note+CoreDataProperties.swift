//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var filling: String

}

extension Note : Identifiable {

}
