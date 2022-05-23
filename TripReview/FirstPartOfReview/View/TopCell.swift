//
//  TopCell.swift
//  TripReview
//
//  Created by Саид on 20.05.2022.
//

import UIKit
import SnapKit

protocol TopCellProtocol: AnyObject {
    func setupViews()
    func setupConstraints()
    func setupImage(_ imageData: Data?)
}

class TopCell: UITableViewCell {
    
    static let identifier = "topCell"
    
    private let userImageView = UIImageView(image: UIImage(named: "defaultImage"))
    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopCell: TopCellProtocol {
    func setupViews() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.layer.cornerRadius = 40
        userImageView.backgroundColor = .white
        userImageView.clipsToBounds = true
        addSubview(userImageView)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .boldSystemFont(ofSize: 20.0)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Офигенно, Вы дошли до конца!\nРасскажите, как Вам?"
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        userImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp_bottom).offset(16)
            make.leading.equalTo(userImageView)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func setupImage(_ imageData: Data?) {
        guard let imageData = imageData, let image = UIImage(data: imageData) else {
            return
        }
        userImageView.image = image
    }
}
