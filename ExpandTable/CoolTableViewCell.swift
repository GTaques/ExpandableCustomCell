//
//  CoolTableViewCell.swift
//  ExpandTable
//
//  Created by Gabriel Taques on 01/09/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class CoolTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var awesomeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
