//
//  LandmarkTableViewController.swift
//  HelloDelegate
//
//  Created by 陳仕偉 on 2021/1/22.
//

import UIKit

class LandmarkTableViewController: UITableViewController {
    
    lazy var landmarks: [Landmark] = {
        Utility.load("landmarkData.json")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LandmarkTableViewCell", for: indexPath) as! LandmarkTableViewCell

        // Configure the cell...
        let landmark = landmarks[indexPath.row];
        cell.config(landmark: landmark)
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let detailTableVC = segue.destination as! DetailTableViewController
        detailTableVC.delegate = self
        let index = tableView.indexPathForSelectedRow!.row
        detailTableVC.landmark = landmarks[index]
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toDetailTableViewControllerSegue" {
            let shouldPerformSegue = (tableView.indexPathForSelectedRow != nil) ? true : false
            return shouldPerformSegue
        }
        return true
    }
}

extension LandmarkTableViewController: DetailTableVCDelegate {
    func detailTableVC(_ detailTableVC: DetailTableViewController, didChangedIn landmark: Landmark) {
        let index = landmarks.firstIndex { $0.id == landmark.id}!
        landmarks[index] = landmark
        tableView.reloadData()
    }
}
