//
//  NotesDetailTextView.swift
//  Notes
//
//  Created by Santhosh Nampally on 18/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol NotesDetailViewDataSource: class {
    var notes:String {get}
}

class NotesDetailView: UIView {

    @IBOutlet weak var notesTextView: UITextView!
    weak var dataSource:NotesDetailViewDataSource?
    
    override func awakeFromNib() {
        notesTextView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
    
    func updateUI() {
        notesTextView.text = dataSource?.notes ?? ""
    }
}
