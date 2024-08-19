//
//  ShowEventTableViewCell.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class ShowEventTableViewCell: UITableViewCell {

    @IBOutlet weak var Repeat:UIButton!
    @IBOutlet weak var did:UILabel!
    @IBOutlet weak var Title:UILabel!
    @IBOutlet weak var Event:UILabel!
    @IBOutlet weak var Venue:UILabel!
    @IBOutlet weak var Date:UILabel!
    @IBOutlet weak var Time:UILabel!
    @IBOutlet weak var Description:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
