//
//  DetailViewController.swift
//  ContactsSwiftyJSON-start
//
//  Created by Raman Kozar on 08/04/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contactsData: ContactModel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = contactsData.name
        statusLabel.text = contactsData.status
        speciesLabel.text = contactsData.species
        genderLabel.text = contactsData.gender
        originLabel.text = contactsData.origin
        
    }

    
    
}
