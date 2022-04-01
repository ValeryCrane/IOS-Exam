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
    private let tableView = UITableView()
    private var notes: [NoteModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchNotes()
    }
    
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

}

// MARK: UITableViewDelegate & DataSource implementation.
extension NotesViewController: UITableViewDelegate { }

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

extension NotesViewController: NotesDisplayLogic {
    func displayNotes(_ notes: [NoteModel]) {
        self.notes = notes
    }
}
