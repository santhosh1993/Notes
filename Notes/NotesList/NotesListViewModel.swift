//
//  NotesListViewModel.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

class NotesListViewModel{
    var listData:[String] = ["Cell 1","Cell 2"]
}

extension NotesListViewModel: NotesListViewDataSource{
    
    func numberOfRows() -> Int {
        return listData.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func dataForIndex(indexPath:IndexPath) -> String {
        return listData[indexPath.row]
    }
}
