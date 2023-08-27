//
//  InfoData+DataSource.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

extension InfoDataTableViewCell: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrScoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvScoreDetail.dequeueReusableCell(withIdentifier: "ScoreDataTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
}
