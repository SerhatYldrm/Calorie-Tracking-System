//
//  DailyProductsCell.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 05/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit

class DailyProductsCell: UITableViewCell {

    @IBOutlet weak var dailytext: UITextField!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var lbldaily: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
