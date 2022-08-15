//
//  ToDoTableViewController.swift
//  ToDoAppSample
//
//  Created by scholar on 8/14/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    /* from iterations 1-2
    //create new objects of the ToDo class and return in an array (to be added to the to do list)
    func createToDos() -> [ToDo] {
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        return [swift, dog]
    }
    */
    
    //initialize array of objects of the ToDos from Core Data
    var toDos : [ToDoCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        /* from iterations 1-2
        //on load, assign the array to the two items from the first function
        toDos = createToDos()
        */
        
    }
    
    // MARK: - Table view data source
    
    //from iteration 3
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData()
        }
      }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        //access one toDo from the array toDos
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
            if toDo.important {
                cell.textLabel?.text = "!" + name
            } else {
                cell.textLabel?.text = toDo.name
            }
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //this gives us a single to do item indexed from the row selecte
        let toDo = toDos[indexPath.row]
        
        //use segue identifier to moved to new VC
        performSegue(withIdentifier: "movetoComplete", sender: toDo)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //called right before a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //reference the AddToDoViewController as the var addVC and the previousVC as this VC
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        
        //reference CompleteToDoViewController and share data from self and selected to do item class data
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    

}
