//
//  CoreDataHandler.swift
//  Notes
//
//  Created by Santhosh Nampally on 20/07/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHandler {
    static let shared = CoreDataHandler()
    let queue = DispatchQueue.init(label: "NotesCoreDataQueue")

    lazy var persistentContainer: NSPersistentContainer? = {
        let dataLoaderBundle = Bundle(for: type(of: self))
        
        if let modelURL = dataLoaderBundle.url(forResource: "NotesModel", withExtension: "momd"),
            let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL) {
            
            let container = NSPersistentContainer.init(name: "NotesModel", managedObjectModel: managedObjectModel)
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            
            return container
        }
        
        return nil
    }()
    
    func getContext() -> NSManagedObjectContext {
        return persistentContainer!.viewContext
    }
    
    func saveContext () {
        let context = getContext()
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataHandler {
    func fetchTheData(entity:String, predicate: NSPredicate?) -> Array<Any>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        
        if let predicate = predicate{
            fetchRequest.predicate = predicate
        }
        
        do{
            let feedUrlAry = try getContext().fetch(fetchRequest)
            return feedUrlAry
        }
        catch {
            return []
        }
    }
    
    func createManagedObject<T:NSManagedObject>(entity:T.Type) -> T {
        return T.init(context: getContext())
    }
}

extension CoreDataHandler {
    func addNote(title:String , description:String, key:String , savedNoteCallBack: @escaping ((Note) -> Void)) {
        queue.async { [weak self] in
            if self != nil {
                let notes = self?.fetchTheData(entity: "Note", predicate: NSPredicate(format: "key == %@", key))
                let note:Note = (notes?.first as? Note) ?? Note(context: self!.getContext())
                
                note.key = key
                note.title = title
                note.notesDescription = description
                note.createdDate = note.createdDate ?? Date()
                note.updatedDate = Date()
                
                self?.saveContext()
                savedNoteCallBack(note)
            }
        }
    }
    
    func getNotes(listCallBack: @escaping (([Note]) -> Void)) {
        queue.async { [weak self] in
            let notes = self?.fetchTheData(entity: "Note", predicate: nil) as? [Note]
            listCallBack(notes ?? [])
        }
    }
    
    func deleteNotes(key:String) {
        queue.async { [weak self] in
            let notes = self?.fetchTheData(entity: "Note", predicate: NSPredicate(format: "key == %@", key))
            if let note = notes?.first as? Note {
                self?.getContext().delete(note)
                self?.saveContext()
            }
        }
    }
}
