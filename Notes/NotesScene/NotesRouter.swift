//
//  NotesRouter.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

protocol NotesRoutingLogic {
    func routeToCreateNote()
}

class NotesRouter {
    public weak var view: UIViewController!
}

extension NotesRouter: NotesRoutingLogic {
    func routeToCreateNote() {
        view.navigationController?.pushViewController(
            CreateNoteViewController(), animated: true)
    }
}
