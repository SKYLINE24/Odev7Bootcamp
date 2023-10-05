//
//  YapilacakCell.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import UIKit

class YapilacaklarCell: UITableViewCell {

    @IBOutlet weak var labelBaslik: UILabel!
    @IBOutlet weak var labelIcerik: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
