//
//  InfoData+Delegate.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

extension InfoDataTableViewCell : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
