//
//  DetailTableViewController.swift
//  HelloDelegate
//
//  Created by 陳仕偉 on 2021/1/22.
//

import UIKit

protocol DetailTableVCDelegate: AnyObject {
    func detailTableVC(_ detailTableVC: DetailTableViewController, didChangedIn Landmark:Landmark )
}

class DetailTableViewController: UITableViewController {
    
    var landmark: Landmark?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var parkLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var landmarkImageView: UIImageView!
    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    
    weak var delegate: DetailTableVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restoreData()
    }

    @IBAction func editBarButtonItemPressed(_ sender: UIBarButtonItem) {
        
        editToggle()
        
        if !nameLabel.isEnabled, var landmark = landmark {
            //Done
            landmark.name = nameLabel.text ?? ""
            landmark.category = categoryLabel.text ?? ""
            landmark.park = parkLabel.text ?? ""
            landmark.state = stateLabel.text ?? ""
            self.delegate?.detailTableVC(self, didChangedIn: landmark)
            
            navigationItem.leftBarButtonItem = nil
            navigationItem.hidesBackButton = false
        } else {
            //Editing
            let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(rollback))
            navigationItem.leftBarButtonItem = cancelBarButtonItem
            navigationItem.hidesBackButton = true
        }
    }
    
    func restoreData(){
        nameLabel.text = landmark?.name
        categoryLabel.text = landmark?.category
        parkLabel.text = landmark?.park
        stateLabel.text = landmark?.state
    }
    
    func editToggle(){
        nameLabel.isEnabled = !nameLabel.isEnabled
        categoryLabel.isEnabled = !categoryLabel.isEnabled
        parkLabel.isEnabled = !parkLabel.isEnabled
        stateLabel.isEnabled = !stateLabel.isEnabled
        editBarButtonItem.title = nameLabel.isEnabled ? "Done" : "Edit"
    }
    
    @objc func rollback() {
        editToggle()
        restoreData()
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = false
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
