//
//  NoteListView.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol NotesListViewDataSource: class  {
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func dataForIndex(indexPath:IndexPath) -> String
}

protocol NotesListViewDelegate: class {
    func selectedIndex(indexpath: IndexPath)
    func addButtontapped()
}

class NotesListView: UIView {

    @IBOutlet weak var notesTableView: UITableView!

    weak var delegate:NotesListViewDelegate?
    weak var dataSource:NotesListViewDataSource?
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.addButtontapped()
    }
    
}

extension NotesListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NotesListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NotesListTableViewCellIdentifier", for: indexPath) as! NotesListTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension NotesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.selectedIndex(indexpath: indexPath)
    }
}

extension NotesListView: NotesListTableViewCellDelegate{
    func dataForCell(ref: NotesListTableViewCell) -> String {
        if let indexPath = notesTableView.indexPath(for: ref){
            return dataSource?.dataForIndex(indexPath: indexPath) ?? ""
        }
        
        return ""
    }
}
