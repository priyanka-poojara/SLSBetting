//
//  LiveCricket+DataSource.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

extension LiveCricketViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        switch segment.selectedSegmentIndex{
        case 0://Info Tab
            return 1
        case 1://Chat Tab
            return arrChat.count
        case 2://Place a Bet
            return 1
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        switch segment.selectedSegmentIndex{
        case 0://Info Tab
            return 2
        
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if segment.selectedSegmentIndex == 0{
            if section == 1{
                return "Ongoing Bets"
            }
        }
        
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segment.selectedSegmentIndex{
        case 0://Info Tab
            
            let infoCell = tbvInningData.dequeueReusableCell(withIdentifier: "InfoDataTableViewCell", for: indexPath) as! InfoDataTableViewCell
            infoCell.selectionStyle = .none
            
            let ongoingCell = tbvInningData.dequeueReusableCell(withIdentifier: "OngoingBetsCell", for: indexPath) as! OngoingBetsCell
            ongoingCell.selectionStyle = .none
            
            if indexPath.section == 0{
                return infoCell
            }else{
                return ongoingCell
            }
            
        case 1://Chat Tab
           
            let chatCell = tbvInningData.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
            chatCell.selectionStyle = .none
            chatCell.ivUser.image = arrChat[indexPath.row].image
            chatCell.lblUserName.text = arrChat[indexPath.row].userName
            chatCell.lblMessage.text = arrChat[indexPath.row].message
            return chatCell
            
        case 2://Place a Bet
            let placeBetCell = tbvInningData.dequeueReusableCell(withIdentifier: "PlaceBetCell", for: indexPath) as! PlaceBetCell
            placeBetCell.selectionStyle = .none
            return placeBetCell
            
        case 3://Line Up
            let lineUpCell = tbvInningData.dequeueReusableCell(withIdentifier: "LineUpCell", for: indexPath) as! LineUpCell
            
            lineUpCell.selectionStyle = .none
            
            return lineUpCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let headertitle = view as? UITableViewHeaderFooterView{
            headertitle.textLabel?.font = AppFont.Regular(16).value
            headertitle.textLabel?.textColor = UIColor.white
        }
        
    }
    
}
