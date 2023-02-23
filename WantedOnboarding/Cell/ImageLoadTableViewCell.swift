//
//  ImageLoadTableViewCell.swift
//  WantedOnboarding
//

import UIKit

class ImageLoadTableViewCell: UITableViewCell {

    @IBOutlet weak var loadImageView: UIImageView!
    weak var delegate : TVCellDelegate?
    var indexPath: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func imageLoadBtn(_ sender: Any) {
        self.loadImageView.image = UIImage(systemName: "photo")
        self.delegate?.imageLoad(indexPath: indexPath)
    }
}
