//
//  ReviewTextsPresenter.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

import Foundation

protocol ReviewTextsProtocol: AnyObject {
    func setupViews()
    func setupConstraints()
    func setupImage(data: Data)
    func showSuccessAlert(message: String)
    func showErrorAlert()
}

protocol ReviewTextsPresenterProtocol: AnyObject {
    init(view: ReviewTextsProtocol, networkService: NetworkServiceProtocol, image: Data?, userMarks: [Int], router: RouterProtocol)
    var router: RouterProtocol? { get set }
    var totalOpinion: Int? { get set }
    var mark: Int? { get set }
    var informativeInfo: Int? { get set }
    var navigationСonvenient: Int? { get set }
    var firstReviewText: String? { get set }
    var secondReviewText: String? { get set }
    func sendReview()
    func dismissVC()
}

class ReviewTextsPresenter: ReviewTextsPresenterProtocol {
    
    weak var view: ReviewTextsProtocol?
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol!
    
    var totalOpinion: Int?
    var mark: Int?
    var informativeInfo: Int?
    var navigationСonvenient: Int?
    var firstReviewText: String?
    var secondReviewText: String?
    
    required init(view: ReviewTextsProtocol, networkService: NetworkServiceProtocol, image: Data?, userMarks: [Int], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.totalOpinion = userMarks[0]
        self.mark = userMarks[1]
        self.informativeInfo = userMarks[2]
        self.navigationСonvenient = userMarks[3]
        guard let imageData = image else { return }
        self.view?.setupImage(data: imageData)
    }
        
    func dismissVC() {
        router?.dismissVC()
    }
    
    func sendReview() {
        //I took review id as 1 by default
        let review = ReviewModel(id: 1, totalOpinion: totalOpinion ?? 2, mark: mark ?? 2, informativeInfo: informativeInfo ?? 2, navigationСonvenient: navigationСonvenient ?? 2, firstDesctiption: firstReviewText ?? "", secondDescription: secondReviewText ?? "")
        
        networkService.sendReview(review: review) { [weak self] responseResult in
            switch responseResult {
            case .success(let message):
                self?.view?.showSuccessAlert(message: message)
            case .failure(let error):
                print(error)
                self?.view?.showErrorAlert()
            }
        }
    }
}
