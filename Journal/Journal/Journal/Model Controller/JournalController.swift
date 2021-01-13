//
//  JournalController.swift
//  Journal
//
//  Created by Theo Davis on 1/13/21.
//

import Foundation

class JournalController {
    //MARK: - Shared Instance this where the app pulls data to and from for CRUD
    static let shared = JournalController()
    
    //this is were the app pulls data to and from 
    var journals: [Journal] = []
    
    func createJournalWith(title: String) {
        let newJournal = Journal
    }
    
    func delete(journal: Journal) {
        
    }
    
    //Here i am creating a way to create a journal entry
    func addEntryTo(journal: String) {
        let newJournal = Journal(journal: journal)
        journals.append(newJournal)
        saveToPersistenceStore()
    }
    
    //this is my delete function to delete the journal entry
    func removeEntryFrom(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        saveToPersistenceStore()
    }
    
    //MARK: - Persistence
    
    //fileURL
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Journals.json")
        return fileURL
    }
    
    //save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(journals)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
        
    }
    //load
    func loadFromPersistanceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundJournals = try JSONDecoder().decode([Journal].self, from: data)
            journals = foundJournals
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    
}//END OF CLASS
