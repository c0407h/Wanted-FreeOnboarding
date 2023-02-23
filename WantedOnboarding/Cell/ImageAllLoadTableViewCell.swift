//
//  ImageAllLoadTableViewCell.swift
//  WantedOnboarding
//

import UIKit

class ImageAllLoadTableViewCell: UITableViewCell {

    weak var delegate : TVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func imageAllLoad(_ sender: Any) {
        self.delegate?.imageAllLoad()
    }
}
