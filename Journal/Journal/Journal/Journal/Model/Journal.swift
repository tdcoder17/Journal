//
//  Journal.swift
//  Journal
//
//  Created by Theo Davis on 1/12/21.
//

import Foundation

class Journal: Codable {
    
    let journal: String
    let journalEntry: [Entry]
    
    init(journal: String, journalEntry: [Entry] = []) {
        self.journal = journal
        self.journalEntry = journalEntry
    }
}//END OF CLASS

extension Journal: Equatable {
    static func == (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.journal == rhs.journal
    }
}

