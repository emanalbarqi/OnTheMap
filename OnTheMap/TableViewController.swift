//
//  TableViewController.swift
//  OnTheMap
//
//  Created by Eman Albarqi on 05/01/2019.
//  Copyright © 2019 Eman Albarqi. All rights reserved.
//

import UIKit

class TableViewController: LocationsViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override var studentLocations: StudentLocationsData? {
        didSet {
            guard let locationsData = studentLocations else { return }
            locations = locationsData.studentLocations
        }
    }
    
    var locations: [StudentLocation] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell")!
        
        cell.textLabel?.text = "\(locations[(indexPath as NSIndexPath).row].firstName!) \(locations[(indexPath as NSIndexPath).row].lastName!)"
        cell.detailTextLabel?.text = locations[(indexPath as NSIndexPath).row].mediaURL!
        cell.imageView?.image = UIImage(named: "icon_pin")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: locations[(indexPath as NSIndexPath).row].mediaURL!), UIApplication.shared.canOpenURL(url)
            else {
                self.showAlert(title: "Error", message: "supplied url is invalid")
                return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
