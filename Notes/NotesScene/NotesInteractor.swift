//
//  NotesInteractor.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation

protocol NotesBusinessLogic: AnyObject {
    func fetchNotes()
    func deleteNote(_ note: NoteModel)
}

class NotesInteractor {
    public var presenter: NotesPresentationLogic!
    private let notesWorker = NotesWorker.shared
}

extension NotesInteractor: NotesBusinessLogic {
    func fetchNotes() {
        let notes = notesWorker.getNotes()
        presenter.presentNotes(notes)
    }
    
    func deleteNote(_ note: NoteModel) {
        notesWorker.remove(note: note)
    }
}


