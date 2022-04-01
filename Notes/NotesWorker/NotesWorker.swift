//
//  NotesWorker.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import CoreData

class NotesWorker {
    static let shared = NotesWorker()
    private init() { }
    
    private let context: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "NotesCoreData")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Container loading failed")
            }
        }
        return container.viewContext
    }()
    
    private func saveChanges() {
        if context.hasChanges {
            try? context.save()
        }
    }
    
    func add(note: NoteModel) {
        let coreNote = Note(context: context)
        coreNote.id = note.id
        coreNote.title = note.title
        coreNote.filling = note.filling
        saveChanges()
    }
    
    func remove(note: NoteModel) {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        guard let coreNotes = try? context.fetch(fetchRequest) else { return }
        
        for coreNote in coreNotes {
            if coreNote.id == note.id {
                context.delete(coreNote)
            }
        }
        
        saveChanges()
    }
    
    func getNotes() -> [NoteModel] {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        guard let coreNotes = try? context.fetch(fetchRequest) else { return [] }
        return coreNotes.compactMap { coreNote in
            guard let id = coreNote.id else { return nil }
            return NoteModel(id: id,
                             title: coreNote.title,
                             filling: coreNote.filling)
        }
    }
}
