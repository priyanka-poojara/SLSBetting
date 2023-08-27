//
//  PlaceBetCell.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 20/12/22.
//

import UIKit

class PlaceBetCell: UITableViewCell {

    @IBOutlet weak var lblLive: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var txtBetTitle: UITextField!
    @IBOutlet var viewReward: [UIView]!
    @IBOutlet weak var txtRewardPoint: UITextField!
    @IBOutlet weak var txtOption: UITextField!
    @IBOutlet weak var btnAddOption: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblLive.RoundMe(Radius: 2)
        
        for placeholder in [txtBetTitle, txtRewardPoint, txtOption]{
            _ = placeholder?.ColorMyPlaceHolder(color: UIColor.A6A9B8)
            placeholder?.appendText(Spacing: 14, Direction: .left)
        }
        
        for reward in viewReward {
            reward.BorderMe(Color: UIColor.EEA364, BorderWidth: 2)
            reward.RoundMe(Radius: 4)
        }
        for views in [txtBetTitle,txtRewardPoint,txtOption,btnAddOption]{
            
            views?.BorderMe(Color: UIColor.C526685, BorderWidth: 2)
            views?.RoundMe(Radius: 4)
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor,UIColor.C24242F.cgColor,])
        bgView.RoundMe(Radius: 8)
        if let gradient = bgView.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = self.bounds
        }
    }
    
}
