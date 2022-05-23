//
//  ViewController.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private let activityIndicatorView = UIActivityIndicatorView()
    private let tripImageView = UIImageView()
    private let tripDescriptionLabel = UILabel()
    private let giveFeedbackButton = PurpleButton()
    
    var presenter: MainVCPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupContraints()
//        for i in 0x1F601...0x1F64F {
//            let c = String(UnicodeScalar(i) ?? "-")
//            print(c, "-", i)
//        }
    }
}

extension MainVC: MainVCProtocol {
    func setupViews() {
        title = "We Go Trip"
        view.backgroundColor = .white
        tripImageView.translatesAutoresizingMaskIntoConstraints = false
        tripImageView.layer.cornerRadius = 10
        tripImageView.clipsToBounds = true
        tripImageView.backgroundColor = .gray.withAlphaComponent(0.7)
        view.addSubview(tripImageView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.startAnimating()
        tripImageView.addSubview(activityIndicatorView)
        tripDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        tripDescriptionLabel.numberOfLines = 0
        tripDescriptionLabel.textColor = UIColor.black.withAlphaComponent(0.9)
        tripDescriptionLabel.text = "Спасибо большое за чудесные эмоции от экскурсии! Все очень понятно и комфортно в использовании! Есть время свободно и внимательно рассматривать экспонаты и двигаться в том направлении, которое оказолось изначально интересно взгляду при этом можно неспеша вернуться на то место, которое рекомендует аудиогид в порядке очереди просмотра! Первый раз воспользовалась этим видом экскурсий и мне понравилось! Рекомендуется использовать для комфортного времяпровождения!"
        view.addSubview(tripDescriptionLabel)
        giveFeedbackButton.titleText = "Оставить отзыв"
        giveFeedbackButton.addTarget(self, action: #selector(giveFeedbackTapped(_:)), for: .touchUpInside)
        view.addSubview(giveFeedbackButton)
    }
    
    func setupContraints() {
        tripImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.top.equalToSuperview().offset(Constants.topBarHeight + 32)
            make.centerX.equalToSuperview()
        }
        activityIndicatorView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        tripDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(tripImageView.snp_bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        giveFeedbackButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
        }
    }
    
    func setTripImage() {
        guard let data = presenter.imageData else { return }
        guard let image = UIImage(data: data) else {
            setupDefaultImage()
            return
        }
        activityIndicatorView.stopAnimating()
        activityIndicatorView.alpha = 0.0
        tripImageView.backgroundColor = .none
        tripImageView.image = image
    }
    
    func showTripImageUploadingError() {
        self.createAlert("Ой", "В ходе загрузки фотографии произошла какя-то ошибка (", "Печалька (")
        setupDefaultImage()
    }
                
    private func setupDefaultImage() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.alpha = 0.0
        tripImageView.backgroundColor = .none
        tripImageView.image = UIImage(named: "defaultImage")
    }
    
    // MARK: - Action
    @objc func giveFeedbackTapped(_ sender: UIButton) {
        presenter.showFirstPartOfReview()
    }
}
