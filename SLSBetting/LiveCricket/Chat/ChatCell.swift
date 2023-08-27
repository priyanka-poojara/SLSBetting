//
//  ChatCell.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 20/12/22.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var bgViewMessage: UIView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivUser.RoundMe(Radius: ivUser.layer.bounds.height / 2)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bgViewMessage.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor, UIColor.C24242F.cgColor])
        bgViewMessage.RoundMe(Radius: 8)
        bgViewMessage.BorderMe(Color: UIColor.C21222D, BorderWidth: 2)
        
    }
}
