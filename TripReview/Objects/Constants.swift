//
//  Constants.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import UIKit

enum FeedbackEmoji: UInt {
    case 😡
    case 😕
    case 😐
    case 😄
    case 😍
    
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
