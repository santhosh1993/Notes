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
    
    weak var delegate:NotesListTableViewCellDelegate?
    
    func updateUI() {
        delegate?.dataForCell(ref: self)
    }
}
