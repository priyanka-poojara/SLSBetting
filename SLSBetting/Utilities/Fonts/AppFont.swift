//
//  AppFont.swift
//  SLSBetting
//
//  Created by Priyanka Poojara on 19/12/22.
//

import UIKit

//MARK: Protocol to Chnage font size and font style

protocol AppFontProtocol {
    var value : UIFont { get }
}

//MARK: Enum for application font and size
enum AppFont : AppFontProtocol{
    
    var value: UIFont {
        
        switch self {
        case .Bold(let size):
            return UIFont(name: "Calibri", size: size) ?? UIFont.boldSystemFont(ofSize: size)
            
        case .Light(let size):
            return UIFont(name: "Calibri", size: size) ?? UIFont.boldSystemFont(ofSize: size)
            
        case .Regular(let size):
            return UIFont(name: "Calibri", size: size) ?? UIFont.systemFont(ofSize: size)
         
        }
    }

    case Bold(_ size : CGFloat)
    case Light(_ size : CGFloat)
    case Regular(_ size : CGFloat)

}
