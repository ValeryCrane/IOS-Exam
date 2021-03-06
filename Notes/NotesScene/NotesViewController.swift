//
//  NotesViewController.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

protocol NotesDisplayLogic: AnyObject {
    func displayNotes(_ notes: [NoteModel])
}

class NotesViewController: UIViewController {
    public var interactor: NotesBusinessLogic!
    public var router: NotesRoutingLogic!
    private let tableView = UITableView()
    private var notes: [NoteModel] = []

    // MARK: - ViewController's life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notes"
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchNotes()
    }
    
    // MARK: - setup functions.
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(openCreateNoteScene))
    }
    
    
    // MARK: - actions.
    @objc private func openCreateNoteScene() {
        router.routeToCreateNote()
    }

}

// MARK: - UITableViewDelegate & DataSource implementation.
extension NotesViewController: UITableViewDelegate {
    
    // So to enable delte action.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, completionHandler in
            
            guard let notes = self?.notes else { completionHandler(true); return }
            
            self?.interactor?.deleteNote(notes[indexPath.row])
            self?.notes.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as? NoteCell
        cell?.setup(note: notes[indexPath.row])
        return cell ?? UITableViewCell()
    }
}


// MARK: - NotesDisplayLogic implementation.
extension NotesViewController: NotesDisplayLogic {
    func displayNotes(_ notes: [NoteModel]) {
        self.notes = notes
        tableView.reloadData()
    }
}
