//
//  PersonTableCell.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PersonTableCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "PersonTableCell"
    
    var person: Person! {
        didSet {
            numberLabel.text = person.number
            nameLabel.text = person.name
        }
    }
    
}
