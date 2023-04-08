//
//  ParsedTableViewController.swift
//  ContactsSwiftyJSON-start
//
//  Created by Raman Kozar on 08/04/2023.
//

import UIKit
import Alamofire
import SwiftyJSON

class ParsedTableViewController: UIViewController {
    
    var constantsArray = [ContactModel]()
    
    @IBOutlet weak var parsingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getJSON_FromAPI {
            print("Data downloading...")
            self.parsingTableView.reloadData()
        }
        
    }

    func getJSON_FromAPI(complition: @escaping GetComplete) {
     
        AF.request(apiURL, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { (apiResponse) in
            
            guard let unwrResponse = apiResponse.value else { return }
            
            let json = JSON(unwrResponse)
            print(json)
            
            for i in 0..<json.count {
                let contactValues = ContactModel(contactDictionary: json[i])
                self.constantsArray.append(contactValues)
            }
            
            complition()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openDetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let unwrParsingRow = parsingTableView.indexPathForSelectedRow?.row,
              let unwrIndexPathForRow = parsingTableView.indexPathForSelectedRow else {
            return
        }
        
        if let destinationViewController = segue.destination as? DetailViewController {
            
            destinationViewController.contactsData = constantsArray[unwrParsingRow]
            parsingTableView.deselectRow(at: unwrIndexPathForRow, animated: true)
            
        }
        
    }

}

extension ParsedTableViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        constantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = parsingTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = constantsArray[indexPath.row].name
        cell.detailTextLabel?.text = constantsArray[indexPath.row].gender
        
        return cell
        
    }
    
}

