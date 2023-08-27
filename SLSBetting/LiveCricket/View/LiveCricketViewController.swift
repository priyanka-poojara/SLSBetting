//
//  LiveCricketViewController.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit
import AVKit

class LiveCricketViewController: UIViewController {
    
    @IBOutlet weak var btnStartBet: UIButton!
    @IBOutlet weak var txtTypeMsj: UITextField!
    @IBOutlet weak var btnEmogi: UIButton!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var viewKeyboard: UIView!
    @IBOutlet weak var btnSendMessage: UIButton!
    @IBOutlet weak var btnPlaceBet: UIButton!{
        didSet{
            btnPlaceBet.GradientView(Direction: .Horizontal, Colors: [UIColor.B93532.cgColor,UIColor.FF443B.cgColor])
        }
    }
    @IBOutlet weak var tbvInningData: UITableView!
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
  
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
   
    var arrChat : [Chat] = [
        Chat(image: UIImage.user1, userName: "Anu", message: "😎😎"),
        Chat(image: UIImage.user2, userName: "Jaqlin", message: "I support Argentina"),
        Chat(image: UIImage.user3, userName: "Anu", message: "😍"),
        Chat(image: UIImage.user2, userName: "Jaqlin", message: "Ha ha haaaa"),
        Chat(image: UIImage.user1, userName: "Anu", message: "😝😝😝😝😝😝😝😝😝😝😝😝"),
        Chat(image: UIImage.user2, userName: "Jaqlin", message: "⚽⚽⚽⚽⚽⚽⚽⚽"),
        Chat(image: UIImage.user3, userName: "Anu", message: "😍"),
        Chat(image: UIImage.user2, userName: "Jaqlin", message: "🥳🥳🥳🥳🥳🥳🥳🥳")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableRegister()
        setUpVideoPlayer()
        segment.setupSegment()
        btnEmogi.RoundMe(Radius: btnEmogi.bounds.height / 2)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        innerViewsPreview()
        if let gradient = btnPlaceBet.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = btnPlaceBet.bounds
        }
    }
    
    //MARK: Table Register
    func tableRegister() {
        
        ///Info Module
        ///1.Reusable cell for Live Score information
        tbvInningData.register(UINib(nibName: "InfoDataTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoDataTableViewCell")
        ///Info Module
        ///2.Reusable Ongoing Bets
        tbvInningData.register(UINib(nibName: "OngoingBetsCell", bundle: nil), forCellReuseIdentifier: "OngoingBetsCell")
        
        ///Chat Module
        ///Reusable Chat Cell Register
        tbvInningData.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        
        ///Place a Bet Module
        ///Reusable Place Bet Cell
        tbvInningData.register(UINib(nibName: "PlaceBetCell", bundle: nil), forCellReuseIdentifier: "PlaceBetCell")
        
        tbvInningData.register(UINib(nibName: "LineUpCell", bundle: nil), forCellReuseIdentifier: "LineUpCell")
        
        ///Table View Delegate DataSource
        tbvInningData.delegate = self
        tbvInningData.dataSource = self
        
    }
    
    //MARK: InnerViews Preview
    fileprivate func innerViewsPreview(){

        //ViewFooter
        viewFooter.GradientView(Direction: .Vertical, Colors: [ UIColor.C11111D.cgColor,UIColor.C131620.cgColor])
        
        ///1.Button Place Bet
        ///Info Module
        btnPlaceBet.RoundMe(Radius: 14)
        btnPlaceBet.GradientView(Direction: .Horizontal, Colors: [UIColor.B93532.cgColor,UIColor.FF443B.cgColor])
        btnPlaceBet.bringSubviewToFront(btnPlaceBet.imageView ?? UIImageView())
        
        ///2.Message Symbol
        ///Info Module
        btnSendMessage.GradientView(Direction: .Vertical, Colors: [UIColor.C24242F.cgColor, UIColor.C15131D.cgColor])
        btnSendMessage.RoundMe(Radius: 8)
        btnSendMessage.BorderMe(Color: UIColor.C21222D, BorderWidth: 2)
        btnSendMessage.bringSubviewToFront(btnSendMessage.imageView ?? UIImageView())


        ///1.KeyboardView
        ///Chat Module
        viewKeyboard.RoundMe(Radius: 27)
        viewKeyboard.GradientView(Direction: .Vertical, Colors: [UIColor.C15131D.cgColor, UIColor.C24242F.cgColor])
        viewKeyboard.BorderMe(Color: UIColor.C21222D, BorderWidth: 2)
        
        ///2.Button Start Bet
        ///Chat Module
        btnStartBet.RoundMe(Radius: btnStartBet.frame.height / 2)
        btnStartBet.GradientView(Direction: .Horizontal, Colors: [UIColor.B93532.cgColor,UIColor.FF443B.cgColor])
        btnStartBet.bringSubviewToFront(btnStartBet.imageView ?? UIImageView())
       
        ///TextField Type msj
        ///Chat Module
        _ = txtTypeMsj.ColorMyPlaceHolder(color: UIColor.A6A9B8)
        txtTypeMsj.appendText(Spacing: 12, Direction: .left)
    }
    
    //MARK: Video Player
    fileprivate func setUpVideoPlayer(){
        ///Video URL
        let videoURL = URL(string: "https://work-updates.com/keepsafe/public/video/Keep%20U%20Safe%203%20explainer%20vid.mp4")
        self.player = AVPlayer(url: videoURL!)
        self.playerViewController = AVPlayerViewController()
        
        playerViewController.player = self.player
        playerViewController.videoGravity = .resizeAspectFill
        playerViewController.view.frame = self.viewVideo.frame
        playerViewController.player?.play()
        self.viewVideo.addSubview(playerViewController.view)
    }
    
    @IBAction func actionSegment(_ sender: Any) {
        segment.setupSegment()
        
        ///Action on various segment selection
        switch segment.selectedSegmentIndex{
        
        ///1.Info
        ///4.Line Up
        case 0,3:
            viewKeyboard.isHidden = true
            btnStartBet.isHidden = true
            
            btnPlaceBet.isHidden = false
            btnSendMessage.isHidden = false
            
        case 1://2.Chat
            viewKeyboard.isHidden = false
            btnStartBet.isHidden = false
            
            btnPlaceBet.isHidden = true
            btnSendMessage.isHidden = true
            
        case 2://3.Place a Bet
            viewKeyboard.isHidden = true
            btnStartBet.isHidden = true
            btnSendMessage.isHidden = true
            
            btnPlaceBet.isHidden = false
             
        default:
            viewKeyboard.isHidden = true
            btnStartBet.isHidden = true
            
            btnPlaceBet.isHidden = true
            btnSendMessage.isHidden = true
        }
        
        ///Table View Reload to update perticular data
        tbvInningData.reloadData()
        tbvInningData.restore()
    }
}
