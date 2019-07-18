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
        detailView.dataSource = viewModel
        detailView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    func data(notes:String) {
        viewModel.notes = notes
    }

}
