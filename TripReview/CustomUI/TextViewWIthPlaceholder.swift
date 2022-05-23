//
//  TextViewWIthPlaceholder.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

import UIKit
import SnapKit

class TextViewWithPlaceholder: UITextView {
    
    private var placeholderColor = UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1.0)
    var placeholder: String? {
        didSet {
            self.text = placeholder
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
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
        self.textColor = UIColor.lightGray
        self.font = .systemFont(ofSize: 18.0)
        self.delegate = self
        self.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
}

extension TextViewWithPlaceholder: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black.withAlphaComponent(0.7)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = UIColor.lightGray
        }
    }
}
