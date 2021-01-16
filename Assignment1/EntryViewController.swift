//
//  EntryViewController.swift
//  Assignment1
//
//  Created by Исмаил Ибрагим on 1/16/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }

    @objc func saveTask(){
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let count = UserDefaults().value(forKey: "count") as! Int
        
        let newCount = count + 1;
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        _ = navigationController?.popViewController(animated: true)
        
    }

}
