//
//  TaskTableViewCell.swift
//  TaskManagerIOS
//
//  Created by Spencer Casteel on 10/30/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
