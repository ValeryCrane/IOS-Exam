//
//  NotesViewController.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

class NotesViewController: UIViewController {
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
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

extension NotesViewController: UITableViewDelegate { }

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as? NoteCell
        cell?.setup(note: NoteModel(title: "Title", filling: "Filling"))
        return cell ?? UITableViewCell()
    }
    
    
}
