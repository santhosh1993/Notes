//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    @IBOutlet weak var detailView: NotesDetailView!
    var viewModel: NotesDetailViewModel = NotesDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        detailView.dataSource = viewModel
        detailView.delegate = self
        detailView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    func data(notes:Note?) {
        viewModel.notes = notes
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        detailView.saveButtonTapped(sender)
    }
}

extension NotesDetailViewController: NotesDetailViewDelegate {
    func saveTheNotes(title: String, description: String) {
        viewModel.saveTheNotes(title: title, description: description)
    }
}

extension NotesDetailViewController: NotesDetailViewModelDelegate {
    func popTheViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
