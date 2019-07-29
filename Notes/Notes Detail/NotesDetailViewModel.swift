//
//  NotesDetailViewModel.swift
//  Notes
//
//  Created by Santhosh Nampally on 18/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

protocol NotesDetailViewModelDelegate: class {
    func popTheViewController()
}

class NotesDetailViewModel: NotesDetailViewDataSource {
    var notes:Note?
    weak var delegate: NotesDetailViewModelDelegate?
    func updateNote(note: Note) {
        notes = note
    }
    
    var title: String? {
        return notes?.title
    }
    
    var notesDescription: String? {
        return notes?.notesDescription
    }
    
    func saveTheNotes(title: String, description: String) {
        CoreDataHandler.shared.addNote(title: title, description: description, key: notes?.key ?? "") { (note) in
            
        }
        delegate?.popTheViewController()
    }
}
