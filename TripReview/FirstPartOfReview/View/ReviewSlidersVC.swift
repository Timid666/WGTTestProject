//
//  FirstPartOfReviewVC.swift
//  TripReview
//
//  Created by Саид on 20.05.2022.
//

import UIKit

class ReviewSlidersVC: UIViewController {
    
    private let mainPointsTableView = UITableView()
    private let continueButton = PurpleButton()
    private let skipButton = GrayTitleButton()
    
    private var pointsDescriptions = [
        "Как Вам тур в целом?",
        "Понравился гид?",
        "Как Вам подача информации?",
        "Удобная навигация между шагами?"
    ]
    
    var presenter: ReviewSlidersVCPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension ReviewSlidersVC: ReviewSlidersVCProtocol {
    func setupViews() {
        mainPointsTableView.register(TopCell.self, forCellReuseIdentifier: TopCell.identifier)
        mainPointsTableView.register(PointCell.self, forCellReuseIdentifier: PointCell.identifier)
        mainPointsTableView.delegate = self
        mainPointsTableView.dataSource = self
        mainPointsTableView.separatorStyle = .none
        mainPointsTableView.delaysContentTouches = false
        view.addSubview(mainPointsTableView)
        continueButton.titleText = "Далее"
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(continueButton)
        skipButton.titleText = "Не хочу отвечать"
        skipButton.addTarget(self, action: #selector(skipButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(skipButton)
    }
    
    func setupConstraints() {
        mainPointsTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(mainPointsTableView.snp_bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp_bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    @objc func continueButtonTapped(_ sender: UIButton) {
        presenter.showSecondPartOfReview()
    }
    
    @objc func skipButtonTapped(_ sender: UIButton) {
        presenter.dismissVC()
    }
}

extension ReviewSlidersVC: UITableViewDelegate {}

extension ReviewSlidersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for view in tableView.subviews {
            if view is UIScrollView {
                (view as? UIScrollView)!.delaysContentTouches = false
                break
            }
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopCell.identifier, for: indexPath) as! TopCell
            cell.setupImage(presenter.imageData)
            cell.selectionStyle = .none
            return cell
        case 1...4:
            let cell = tableView.dequeueReusableCell(withIdentifier: PointCell.identifier, for: indexPath) as! PointCell
            cell.selectionStyle = .none
            cell.delegate = self
            cell.setupCell(indexPath.row - 1, pointsDescriptions[indexPath.row - 1])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ReviewSlidersVC: PointCellDelegate {
    func getUserMark(_ cellId: Int, _ mark: Int) {
        presenter.userMarks[cellId] = mark
    }
}
