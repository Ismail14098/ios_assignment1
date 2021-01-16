//
//  TaskViewController.swift
//  Assignment1
//
//  Created by Исмаил Ибрагим on 1/16/21.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var task: String?
    var id: Int?
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func deleteTask(){
        let count = UserDefaults().value(forKey: "count") as! Int
        let newCount = count - 1
        guard let currentPosition = id else {
            return
        };
        let currentPos = currentPosition + 1
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(currentPos)") //if delete 0'el task_1 5el count=5
        if currentPosition != count-1 {
            for x in currentPos+1...count {
                let taskTemp = UserDefaults().value(forKey: "task_\(x)") as? String //task_2
                let temp = x - 1
                UserDefaults().setValue(taskTemp, forKey: "task_\(temp)") //task_1
            }
        }
        
        update?()
        _ = navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
