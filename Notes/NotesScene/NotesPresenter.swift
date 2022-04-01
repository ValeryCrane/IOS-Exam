//
//  NotesPresenter.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation

protocol NotesPresentationLogic: AnyObject {
    func presentNotes(_ notes: [NoteModel])         // Presents notes in view.
}

class NotesPresenter {
    public weak var view: NotesDisplayLogic!
}

// MARK: - NotesPresentationLogic implementation.
extension NotesPresenter: NotesPresentationLogic {
    func presentNotes(_ notes: [NoteModel]) {
        view.displayNotes(notes)
    }
}
