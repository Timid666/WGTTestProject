//
//  BaseButton.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import UIKit
import SnapKit

class PurpleButton: UIButton {
    
    var customBackgroundColor = UIColor(red: 86/255, green: 71/255, blue: 248/255, alpha: 1.0)
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = customBackgroundColor
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(52)
        }
    }
}
