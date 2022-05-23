//
//  SliderForReview.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

import UIKit
import SnapKit
import StepSlider

class SliderForReview: StepSlider {
    
    private let customGrayColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 0.3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.maxCount = 5
        self.setIndex(2, animated: false)
        self.trackColor = customGrayColor
        self.tintColor = customGrayColor
        self.trackCircleRadius = 3
        self.sliderCircleImage = UIImage().resizeImage(image: UIImage(named: "customCircle")!, targetSize: CGSize(width: 60, height: 60))
    }
}
