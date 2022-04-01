//
//  NotesWorker.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation

class NotesWorker {
    static let shared = NotesWorker()
    private init() { }
    
    private var notes: [NoteModel] = [NoteModel(title: "Title", filling: "Filling"),
                                      NoteModel(title: "Title", filling: "Filling"),
                                      NoteModel(title: "Title", filling: "Filling")]
    
    func add(note: NoteModel) {
        notes.insert(note, at: 0)
    }
    
    func remove(note: NoteModel) {
        notes = notes.filter { $0.id == note.id }
    }
    
    func getNotes() -> [NoteModel] {
        return notes
    }
}
