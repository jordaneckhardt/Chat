//
//  TableViewCell1.swift
//  Chat
//
//  Created by Jordan Eckhardt on 2022-02-15.
//

import UIKit

class TableViewCell1: UITableViewCell {
	@IBOutlet weak var label: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
