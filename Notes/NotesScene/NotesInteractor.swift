//
//  NotesInteractor.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation

protocol NotesBusinessLogic: AnyObject {
    func fetchNotes()                           // Fetches notes from NoteWorker.
    func deleteNote(_ note: NoteModel)          // Deletes notes from NoteWorker.
}

class NotesInteractor {
    public var presenter: NotesPresentationLogic!
    private let notesWorker = NotesWorker.shared
}

// MARK: - NotesBusinessLogic implementation.
extension NotesInteractor: NotesBusinessLogic {
    func fetchNotes() {
        let notes = notesWorker.getNotes()
        presenter.presentNotes(notes)
    }
    
    func deleteNote(_ note: NoteModel) {
        notesWorker.remove(note: note)
    }
}


