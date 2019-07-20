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
    
    public static func addNotesWith(title:String, description: String, key:String) {
        shared.addNotes(title: title, description: description, key: key)
    }
    
    func showNotesListVC() {
        if let notesNavigationVC = UIStoryboard(name: "NotesStoryboard", bundle: Bundle(for: type(of: self))).instantiateViewController(withIdentifier: "NotesNaviationControllerIdentifier") as? UINavigationController {
            DispatchQueue.main.async {
                UIApplication.shared.delegate?.window??.rootViewController?.present(notesNavigationVC, animated: false, completion: {
                    
                })
            }
        }
    }
    
    func addNotes(title:String, description: String, key:String) {
        if let notesNavigationVC = UIStoryboard(name: "NotesStoryboard", bundle: Bundle(for: type(of: self))).instantiateViewController(withIdentifier: "NotesNaviationControllerIdentifier") as? UINavigationController {
            DispatchQueue.main.async {
                if let vc = notesNavigationVC.viewControllers.first as? NotesListViewController{
                    vc.pushToDetailVC(title: title, description: description, key: key)
                    UIApplication.shared.delegate?.window??.rootViewController?.present(notesNavigationVC, animated: false, completion: {
                        
                    })
                }
            }
        }
    }
}
