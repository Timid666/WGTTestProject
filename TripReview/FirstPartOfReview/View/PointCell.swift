//
//  PointCell.swift
//  TripReview
//
//  Created by Саид on 20.05.2022.
//

import UIKit
import MultiSlider
import StepSlider

protocol PointCellDelegate: AnyObject {
    func getUserMark(_ cellId: Int, _ mark: Int)
}

protocol PointCellProtocol: AnyObject {
    func setupViews()
    func setupConstraints()
}

class PointCell: UITableViewCell {
    
    static let identifier = "pointCell"
    
    weak var delegate: PointCellDelegate?
    
    private let descriptionLabel = UILabel()
    private let stepSlider = SliderForReview()
    private let emojiLabel = UILabel()
    var cellId = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PointCell: PointCellProtocol {
    func setupViews() {
        contentView.isUserInteractionEnabled = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = FeedbackEmoji.init(rawValue: 2)?.emojiString
        emojiLabel.font = .systemFont(ofSize: 16.0)
        addSubview(emojiLabel)
        stepSlider.addTarget(self, action: #selector(sliderValueChangeg(_:)), for: .valueChanged)
        addSubview(stepSlider)
    }
    
    @objc func sliderValueChangeg(_ sender: StepSlider) {
        emojiLabel.text = FeedbackEmoji.init(rawValue: sender.index)?.emojiString
        delegate?.getUserMark(cellId, Int(sender.index))
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        emojiLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel)
            make.trailing.equalToSuperview().offset(-16)
        }
        stepSlider.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.top.equalTo(emojiLabel.snp_bottom).offset(16)
            make.trailing.equalTo(emojiLabel)
            make.leading.equalTo(descriptionLabel)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func setupCell(_ cellId: Int, _ desctiption: String) {
        self.cellId = cellId
        descriptionLabel.text = desctiption
    }
}
