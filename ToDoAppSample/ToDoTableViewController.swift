//
//  ToDoTableViewController.swift
//  ToDoAppSample
//
//  Created by scholar on 8/14/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    //create new objects of the ToDo class and return in an array (to be added to the to do list)
    func createToDos() -> [ToDo] {
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        return [swift, dog]
    }
    
    //initialize array of objects of the ToDo class
    var toDos : [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //on load, assign the array to the two items from the first function
        toDos = createToDos()
    }

    // MARK: - Table view data source

 /* DELETE THIS FUNCTION
  override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    } */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        //access one toDo from the array toDos
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "!" + toDo.name

        } else {
            cell.textLabel?.text = toDo.name
        }

        return cell
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
