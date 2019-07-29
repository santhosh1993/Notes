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
    func updateUI()
}

class NotesListViewModel{
    var listData:[Note] = []
    var selectedNote:Note?
    var delegate: NotesListViewModelDelegate?
    
    init() {
        CoreDataHandler.shared.getNotes { [weak self] (notes) in
            DispatchQueue.main.async { [weak self] in
                self?.listData = notes
                self?.delegate?.updateUI()
            }
        }
    }
    
    func dataForDetailView() -> Note? {
        return selectedNote
    }
    
    func viewWillAppear() {
        CoreDataHandler.shared.getNotes { [weak self] (notes) in
            DispatchQueue.main.async { [weak self] in
                self?.listData = notes
                self?.delegate?.updateUI()
            }
        }
    }
    
    func selectedIndex(index:IndexPath) {
        selectedNote = listData[index.row]
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.pushToDetailView()
        }
    }
    
    func updateSelectedNote(title:String, description:String, key: String) {
        CoreDataHandler.shared.addNote(title: title, description: description, key: key) { [weak self] (note) in
            DispatchQueue.main.async { [weak self] in
                self?.selectedNote = note
                self?.delegate?.pushToDetailView()
            }
        }
    }
    
    func addNewNotes() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.pushToDetailView()
        }
    }
    
    func closeButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.dismissTheNotes()
        }
    }
    
    func deleteActionOccurred(indexPath: IndexPath) {
        CoreDataHandler.shared.deleteNotes(key: listData[indexPath.row].key ?? "")
        viewWillAppear()
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
        return listData[indexPath.row].title ?? ""
    }
}
