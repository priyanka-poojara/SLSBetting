//
//  LineUpCell.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 21/12/22.
//

import UIKit

class LineUpCell: UITableViewCell {

    @IBOutlet weak var viewBg: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBg.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor,UIColor.C24242F.cgColor])
        viewBg.RoundMe(Radius: 8)

        if let gradient = viewBg.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = self.bounds
        }
    }

}
