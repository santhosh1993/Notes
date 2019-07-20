//
//  NotesListTableViewCell.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

protocol NotesListTableViewCellDelegate: class {
    func dataForCell(indexPath: IndexPath) -> String
}

class NotesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    var indexPath:IndexPath?
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
        if let indexPath = indexPath {
            let data = delegate?.dataForCell(indexPath:indexPath)
            titleLbl.text = data
        }
    }
}
