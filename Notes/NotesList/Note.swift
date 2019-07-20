//
//  Note.swift
//  Notes
//
//  Created by Santhosh Nampally on 20/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

class Note: NotesDetailViewDataSource {
    var title:String
    var description: String

    init(title:String, description: String) {
        self.title = title
        self.description = description
    }
}
