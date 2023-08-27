//
//  OngoingBetsCell.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

class OngoingBetsCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var guessPlayer2: UIButton!
    @IBOutlet weak var guessPlayer1: UIButton!
    @IBOutlet weak var viewEarnedPoint: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        viewEarnedPoint.layer.borderWidth = 2
        viewEarnedPoint.layer.borderColor = UIColor.DD7E06.cgColor
        viewEarnedPoint.RoundMe(Radius: 4)
        
        guessPlayer1.layer.borderWidth = 2
        guessPlayer1.layer.borderColor = UIColor.C037BE8.cgColor
        guessPlayer1.RoundMe(Radius: 2)
        
        guessPlayer2.layer.borderWidth = 2
        guessPlayer2.layer.borderColor = UIColor.C009B3A.cgColor
        guessPlayer2.RoundMe(Radius: 2)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor,UIColor.C24242F.cgColor])
        bgView.RoundMe(Radius: 8)

        if let gradient = bgView.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = self.bounds
        }
    }
    
}
