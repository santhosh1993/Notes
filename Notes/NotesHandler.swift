//
//  Notes.swift
//  Notes
//
//  Created by Santhosh Nampally on 17/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

public class Notes {
    static let shared:Notes = Notes()
    
    public static func showNotes() {
        shared.showNotesListVC()
    }
    
    func showNotesListVC() {
        if let notesNavigationVC = UIStoryboard(name: "NotesStoryboard", bundle: Bundle(for: type(of: self))).instantiateViewController(withIdentifier: "NotesNaviationControllerIdentifier") as? UINavigationController {
            DispatchQueue.main.async {
                UIApplication.shared.delegate?.window??.rootViewController?.present(notesNavigationVC, animated: false, completion: {
                    
                })
            }
        }
    }
}
