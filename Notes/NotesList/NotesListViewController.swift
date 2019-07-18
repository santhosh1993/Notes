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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NotesDetailViewController {
            vc.data(notes: "Shopping List\r\r1. Cheese\r2. Biscuits\r3. Sausages\r4. IMPORTANT Cash for going out!\r5. -potatoes-\r6. A copy of iOS6 by tutorials\r7. A new iPhone\r8. A present for mum")
        }
    }
 
}

extension NotesListViewController: NotesListViewDelegate{
    func selectedIndex(indexpath: IndexPath) {
        performSegue(withIdentifier: "ListToDetailIdentifier", sender: self)
    }
    
    func addButtontapped() {
        
    }
}
