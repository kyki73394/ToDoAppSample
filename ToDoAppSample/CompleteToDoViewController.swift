//
//  CompleteToDoViewController.swift
//  ToDoAppSample
//
//  Created by scholar on 8/14/22.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add? == if selectedToDo then use, otherwise nil
        titleLabel.text = selectedToDo?.name
    }
    
    //Complete Button
    @IBAction func completeTapped(_ sender: Any) {
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
        
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
