
//
//  ShowChainEventTableViewCell.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class ShowChainEventTableViewCell: UITableViewCell {
    @IBOutlet weak var Title:UILabel!
    @IBOutlet weak var Nextbutton:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
