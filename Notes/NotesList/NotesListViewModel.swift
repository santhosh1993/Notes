//
//  NotesListViewModel.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

protocol NotesListViewModelDelegate {
    func pushToDetailView()
    func dismissTheNotes()
}

class NotesListViewModel{
    var listData:[Note] = []
    var selectedNote:Note = Note(title: "", description: "")
    var delegate: NotesListViewModelDelegate?
    
    func dataForDetailView() -> Note {
        return selectedNote
    }
    
    func selectedIndex(index:IndexPath) {
        selectedNote = listData[index.row]
        delegate?.pushToDetailView()
    }
    
    func updateSelectedNote(title:String, description:String) {
        selectedNote.title = title
        selectedNote.description = description
        delegate?.pushToDetailView()
    }
    
    func addNewNotes() {
        delegate?.pushToDetailView()
    }
    
    func closeButtonTapped() {
        delegate?.dismissTheNotes()
    }
}

extension NotesListViewModel: NotesListViewDataSource{
    
    func numberOfRows() -> Int {
        return listData.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func dataForIndex(indexPath:IndexPath) -> String {
        return listData[indexPath.row].title
    }
}
