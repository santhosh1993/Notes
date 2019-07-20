//
//  NotesDetailTextView.swift
//  Notes
//
//  Created by Santhosh Nampally on 18/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol NotesDetailViewDataSource: class {
    var title:String {get}
    var description:String {get}
}

class NotesDetailView: UIView {

    @IBOutlet weak var notesTitleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    weak var dataSource:NotesDetailViewDataSource?
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(prefferedContentSizeChanged(notification:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
        notesTextView.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        notesTextView.layer.borderWidth = 1.0
        
    }
    
    @objc func prefferedContentSizeChanged(notification: NSNotification) {
        updateFont()
    }
    
    func updateFont() {
        notesTextView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
    
    func updateUI() {
        updateFont()
        notesTitleTextField.text = dataSource?.title
        notesTextView.text = dataSource?.description ?? ""
    }
}
