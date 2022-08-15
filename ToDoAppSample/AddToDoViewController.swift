//
//  AddToDoViewController.swift
//  ToDoAppSample
//
//  Created by scholar on 8/14/22.
//

import UIKit

class AddToDoViewController: UIViewController {

    //reference to other view controller class
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Add Item button
    @IBAction func addTapped(_ sender: Any) {
        
        //WITH CORE DATA VERSION--Iteration 3
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            //create a ToDoCD object named toDo
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                //input for the attributes on CD page
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
        
        
        /* WITHOUT CORE DATA VERSION
        
        //create new object of ToDo() class
        let toDo = ToDo()
        
        //create new var to hold text info, add to class
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        //add new toDo to array on previous VC
        previousVC.toDos.append(toDo)
        
        //update (add changes) and reload (show changes) the table view
        previousVC.tableView.reloadData()
        
        //return to the vc of the to do list
        navigationController?.popViewController(animated: true)
         
        */
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
