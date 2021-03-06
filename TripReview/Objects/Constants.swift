//
//  Constants.swift
//  TripReview
//
//  Created by Π‘Π°ΠΈΠ΄ on 19.05.2022.
//

import UIKit

enum FeedbackEmoji: UInt {
    case π‘
    case π
    case π
    case π
    case π
    
    var emojiString: String {
        return String("\(self)")
    }
}

class Constants {
    static var topBarHeight: CGFloat = {
        let height = UIApplication.shared.statusBarFrame.size.height + UINavigationController().navigationBar.frame.height
        return height
    }()
}
