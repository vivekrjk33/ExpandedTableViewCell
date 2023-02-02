//
//  DetailTableViewCell.swift
//  ExpandTableViewCell
//
//  Created by Vivek on 02/02/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    // Empty clouser
    
    var moreBtnClicked : (() -> (Void))!
  
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailTxt: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    
    @IBAction func moreClickBtn(_ sender: UIButton) {
        // Clouser Calling
        moreBtnClicked()
        
    }
    
}
