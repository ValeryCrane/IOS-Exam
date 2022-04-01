//
//  NotesRouter.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

protocol NotesRoutingLogic {
    func routeToCreateNote()            // Routes to menu of creating new note.
}

class NotesRouter {
    public weak var view: UIViewController!
}

// MARK: - NotesRoutingLogic implementation.
extension NotesRouter: NotesRoutingLogic {
    func routeToCreateNote() {
        view.navigationController?.pushViewController(
            CreateNoteViewController(), animated: true)
    }
}
