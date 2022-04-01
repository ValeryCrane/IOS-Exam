//
//  NoteCell.swift
//  Notes
//
//  Created by Валерий Журавлев on 01.04.2022.
//

import Foundation
import UIKit

class NoteCell: UITableViewCell {
    static let reuseIdentifier = "NoteCell"
    private let title = UILabel()
    private let filling = UILabel()
    
    func setup(note: NoteModel) {
        title.text = note.title
        filling.text = note.filling
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        title.font = .systemFont(ofSize: 24, weight: .bold)
        filling.font = .systemFont(ofSize: 16, weight: .light)
        title.numberOfLines = 1
        filling.numberOfLines = 3
        
        self.addSubview(title)
        self.addSubview(filling)
        title.translatesAutoresizingMaskIntoConstraints = false
        filling.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            filling.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            filling.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            filling.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            filling.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
