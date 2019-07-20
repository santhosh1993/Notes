//
//  NotesDetailViewModel.swift
//  Notes
//
//  Created by Santhosh Nampally on 18/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

class NotesDetailViewModel: NotesDetailViewDataSource {
    var notes:Note?
    
    func updateNote(note: Note) {
        notes = note
    }
    
    var title: String {
        return notes?.title ?? ""
    }
    
    var description: String {
        return notes?.description ?? ""
    }
}
