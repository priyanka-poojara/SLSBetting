//
//  InfoDataTableViewCell.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

struct ScoreData{

    var score1: String
    var title: String
    var score2: String

}

class InfoDataTableViewCell: UITableViewCell {

    @IBOutlet weak var tbvHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var lblLive: UILabel!
    @IBOutlet weak var tbvScoreDetail: UITableView!
    var gradient = CAGradientLayer()
    var arrScoreData = [
        ScoreData(score1: "12", title: "Shooting", score2: "22"),
        ScoreData(score1: "22", title: "Attacks", score2: "43"),
        ScoreData(score1: "42", title: "Possession", score2: "55"),
        ScoreData(score1: "32", title: "Corners", score2: "04"),
        ScoreData(score1: "28", title: "Card", score2: "11")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblLive.RoundMe(Radius: 2)
        bgView.RoundMe(Radius: 8)
        bgView.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor,UIColor.C24242F.cgColor])
        tableRegister()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.GradientView(Direction: .Vertical, Colors: [ UIColor.C15131D.cgColor,UIColor.C24242F.cgColor])
        tbvHeightConstant.constant = CGFloat(30 * arrScoreData.count)
        
        if let gradient = bgView.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = self.bounds
        }
        
    }

    fileprivate func tableRegister(){
        tbvScoreDetail.register(UINib(nibName: "ScoreDataTableViewCell", bundle: nil), forCellReuseIdentifier: "ScoreDataTableViewCell")
        tbvScoreDetail.delegate   = self
        tbvScoreDetail.dataSource = self
    }
}
