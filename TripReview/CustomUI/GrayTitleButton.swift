//
//  CustomSkipButton.swift
//  TripReview
//
//  Created by Саид on 22.05.2022.
//

import UIKit
import SnapKit

class GrayTitleButton: UIButton {
    
    private var customTitleColor = UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1.0)
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
        self.titleLabel?.textColor = customTitleColor
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(52)
        }
    }
}
