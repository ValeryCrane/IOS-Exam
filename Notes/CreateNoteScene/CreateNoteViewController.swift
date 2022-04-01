//
//  CreateNoteViewController.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

class CreateNoteViewController: UIViewController {
    private let notesWorker = NotesWorker.shared
    private let titleField = UITextField()
    private let fillingView = UITextView()
    
    // MARK: - ViewController's life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Create note"
        setupLayout()
        setupNavigationBar()
    }
    
    // MARK: - setup functions.
    private func setupLayout() {
        titleField.placeholder = "Title"
        titleField.font = .systemFont(ofSize: 32, weight: .bold)
        fillingView.isEditable = true
        fillingView.font = .systemFont(ofSize: 16)
        
        view.addSubview(titleField)
        view.addSubview(fillingView)
        
        titleField.translatesAutoresizingMaskIntoConstraints = false
        fillingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            fillingView.topAnchor.constraint(equalTo: titleField.bottomAnchor),
            fillingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            fillingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            fillingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done", style: .done, target: self, action: #selector(addNote))
    }
    
    // MARK: - actions.
    @objc private func addNote() {
        if let title = titleField.text, !title.isEmpty {
            let filling = fillingView.text ?? ""
            notesWorker.add(note: NoteModel(title: title, filling: filling))
            navigationController?.popViewController(animated: true)
        }
    }
    
}
