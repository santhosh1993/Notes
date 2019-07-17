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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesListVw.delegate = self
        notesListVw.dataSource = viewModel
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NotesListViewController: NotesListViewDelegate{
    func selectedIndex(indexpath: IndexPath) {
        
    }
    
    func addButtontapped() {
        
    }
}
