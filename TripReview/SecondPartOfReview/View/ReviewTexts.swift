//
//  SecondPartOfReview.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

import UIKit

class ReviewTextsVC: UIViewController {
    
    private let userImageView = UIImageView(image: UIImage(named: "defaultImage"))
    private let topLabel = UILabel()
    private let topTextView = TextViewWithPlaceholder()
    private let bottomLabel = UILabel()
    private let bottomTextView = TextViewWithPlaceholder()
    private let saveReviewButton = PurpleButton()
    private let skipButton = GrayTitleButton()
    
    var presenter: ReviewTextsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        guard let firstReviewText = topTextView.text, let secondReviewText = bottomTextView.text else { return }
        presenter.firstReviewText = firstReviewText
        presenter.secondReviewText = secondReviewText
        presenter.sendReview()
    }
    
    @objc func skipButtonTapped(_ sender: UIButton) {
        presenter.dismissVC()
    }
}

extension ReviewTextsVC: ReviewTextsProtocol {
    func setupViews() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.layer.cornerRadius = 40
        userImageView.backgroundColor = .white
        userImageView.clipsToBounds = true
        view.addSubview(userImageView)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Что Вам особенно понравилось в этом туре?"
        topLabel.font = .systemFont(ofSize: 18.0)
        view.addSubview(topLabel)
        topTextView.placeholder = "Напишите здесь, чем Вам запомнился тур, посоветуете ли его друзьям и как, удалось ли повеселиться?"
        view.addSubview(topTextView)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Как мы могли бы улучшить подачу информации?"
        bottomLabel.font = .systemFont(ofSize: 18.0)
        view.addSubview(bottomLabel)
        bottomTextView.placeholder = "Напишите здесь, чем Вам запомнился тур, посоветуете ли его друзьям и как, удалось ли повеселиться?"
        view.addSubview(bottomTextView)
        saveReviewButton.translatesAutoresizingMaskIntoConstraints = false
        saveReviewButton.titleText = "Сохранить отзыв"
        saveReviewButton.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(saveReviewButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.titleText = "Пропустить"
        skipButton.addTarget(self, action: #selector(skipButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(skipButton)
    }
    
    func setupConstraints() {
        userImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp_bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        topTextView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp_bottom).offset(16)
        }
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(topTextView.snp_bottom).offset(16)
            make.leading.trailing.equalTo(topLabel)
        }
        bottomTextView.snp.makeConstraints { make in
            make.top.equalTo(bottomLabel.snp_bottom).offset(16)
        }
        saveReviewButton.snp.makeConstraints { make in
            make.bottom.equalTo(skipButton.snp_top).offset(-16)
            make.centerX.equalToSuperview()
        }
        skipButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func setupImage(data: Data) {
        userImageView.image = UIImage(data: data)
    }
    
    func showSuccessAlert(message: String) {
        self.createAlert("Ваш отзыв отправлен", "Благодарим Вас за отзыв. Нам очень приятно :)", "Пжл )")
        presenter.dismissVC()
    }
    
    func showErrorAlert() {
        self.createAlert("Что-то пошло не так", "Не удалось отправить Ваш отзыв. Приносим извинения", ":(")
        presenter.dismissVC()
    }
}
