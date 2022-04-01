//
//  NotesAssembly.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

class NotesAssembly {
    private init() { }
    static func assemble() -> UIViewController {
        let view = NotesViewController()
        let interactor = NotesInteractor()
        let presenter = NotesPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}