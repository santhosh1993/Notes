//
//  NotesListTableViewCell.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol NotesListTableViewCellDelegate: class {
    func dataForCell(ref: NotesListTableViewCell) -> String
}

class NotesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    weak var delegate:NotesListTableViewCellDelegate?
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(prefferedContentSizeChanged(notification:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func prefferedContentSizeChanged(notification: NSNotification) {
        updateFont()
    }
    
    func updateFont() {
        titleLbl.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
    
    func updateUI() {
        let data = delegate?.dataForCell(ref: self)
        titleLbl.text = data
    }
}
