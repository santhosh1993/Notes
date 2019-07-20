//
//  NotesListViewController.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {

    @IBOutlet var notesListVw: NotesListView!
    var viewModel: NotesListViewModel = NotesListViewModel()
    
    override func awakeFromNib() {
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesListVw.delegate = self
        notesListVw.dataSource = viewModel
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NotesDetailViewController {
            vc.data(notes: viewModel.dataForDetailView())
        }
    }
    
    func pushToDetailVC(title:String, description: String, key: String) {
        viewModel.updateSelectedNote(title: title, description: description, key: key)
    }
 
}

extension NotesListViewController: NotesListViewDelegate{
    func selectedIndex(indexpath: IndexPath) {
        viewModel.selectedIndex(index: indexpath)
    }
    
    func addButtontapped() {
        viewModel.addNewNotes()
    }
    
    func closeButtonTapped() {
        viewModel.closeButtonTapped()
    }
    
    func updateUI() {
        notesListVw.updateUI()
    }
}

extension NotesListViewController: NotesListViewModelDelegate {
    func pushToDetailView() {
        performSegue(withIdentifier: "ListToDetailIdentifier", sender: self)
    }
    
    func dismissTheNotes() {
        navigationController?.dismiss(animated: true) {
            
        }
    }
}
