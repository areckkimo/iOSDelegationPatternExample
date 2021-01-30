//
//  LandmarkTableViewCell.swift
//  HelloDelegate
//
//  Created by 陳仕偉 on 2021/1/22.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(landmark: Landmark){
        name.text = landmark.name
        category.text = landmark.category
    }

}
