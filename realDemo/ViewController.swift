//
//  ViewController.swift
//  realDemo
//
//  Created by Vibha Kumari Dey on 06/05/25.
//
import RealmSwift
import UIKit

class Contact: Object{
    @Persisted var firstname: String
    @Persisted var lastname: String
    
   convenience init(firstname: String, lastname: String) {
       self.init()
       self.firstname = firstname
        self.lastname = lastname
    }
}
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var contactTableView: UITableView!
    var contactArray = [Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        
    }
    
    @IBAction func addContactTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Contact", message: "Please enter your contact details", preferredStyle: .alert)

               alertController.addTextField { textField in
                   textField.placeholder = "First Name"
               }
               alertController.addTextField { textField in
                   textField.placeholder = "Last Name"
               }

               let save = UIAlertAction(title: "Save", style: .default) { _ in
                   if let firstNameTextField = alertController.textFields?.first?.text,
                      let lastNameTextField = alertController.textFields?.last?.text {
//                       DatabaseHelper.shared.saveContact(contact: Contact(firstname: firstNameTextField, lastname: lastNameTextField))
                       // Create and save new contact
                                   let newContact = Contact(firstname: firstNameTextField, lastname: lastNameTextField)
                                   DatabaseHelper.shared.saveContact(contact: newContact)
                       self.contactArray.append(Contact(firstname: firstNameTextField, lastname: lastNameTextField))
                       self.contactTableView.reloadData()
                   }
               }
               let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

               alertController.addAction(save)
               alertController.addAction(cancel)

               present(alertController, animated: true)
           }
       }

       
       extension ViewController {
           func configuration() {
               contactTableView.dataSource = self
               contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
               
           }
       }
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "cell")  else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            
        }
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = contactArray[indexPath.row].firstname
        cell.detailTextLabel?.text = contactArray[indexPath.row].lastname
        return cell
    }
}
