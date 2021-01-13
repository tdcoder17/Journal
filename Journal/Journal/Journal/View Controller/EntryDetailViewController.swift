//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Theo Davis on 1/12/21.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets
    
    @IBOutlet weak var titleFieldView: UITextField!
    @IBOutlet weak var textFieldView: UITextView!
    
    //MARK: - Properties
    var entry: Entry?
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        titleFieldView.delegate = self
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleFieldView.text, !title.isEmpty,
              let body = textFieldView.text, !body.isEmpty else { return }
        
        EntryController.shared.createEntryWith(titleEntry: title, bodyEntry: body)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleFieldView.text = ""
        textFieldView.text = ""
    }
    
    //MARK: - Helper
    
    func updateView() {
        guard let entry = entry else { return }
        textFieldView.text = entry.text
        titleFieldView.text = entry.title
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleFieldView.resignFirstResponder()
    }
}//END OF CLASS
