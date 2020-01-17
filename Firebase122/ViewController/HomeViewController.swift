//
//  ViewController.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var people = [Person]() {
        didSet {
            self.homeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Create a Person", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { at in
            guard let fields = alert.textFields,
                let name = fields.first?.text,
                let number = fields.last?.text else { return }
            
            let person = Person(name: name, number: number, uid: NSUUID().uuidString)
            FireManager.savePerson(person)
            self.people.append(person)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { one in
            one.tag = 1
            one.placeholder = "Name.."
        }
        alert.addTextField { two in
            two.tag = 2
            two.placeholder = "Phone Number.."
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func setup() {
        homeTableView.register(UINib(nibName: PersonTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: PersonTableCell.identifier)
        homeTableView.tableFooterView = UIView(frame: .zero)
        FireManager.getPeople { [weak self] ppl in
            self?.people = ppl
        }
    }
    


}
//MARK: Table View
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableCell.identifier, for: indexPath) as! PersonTableCell
        let person = people[indexPath.row]
        cell.person = person
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let person = people[indexPath.row]
            FireManager.delete(person)
            people.remove(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
