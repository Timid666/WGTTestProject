//
//  ReviewSlidersVCPresenter.swift
//  TripReview
//
//  Created by Саид on 20.05.2022.
//

import Foundation

protocol ReviewSlidersVCProtocol: AnyObject {
    func setupViews()
    func setupConstraints()
}

protocol ReviewSlidersVCPresenterProtocol: AnyObject {
    init(view: ReviewSlidersVCProtocol, imageData: Data?, userMarks: [Int], router: RouterProtocol)
    var router: RouterProtocol? { get set }
    var imageData: Data? { get set }
    var userMarks: [Int] { get set }
    func showSecondPartOfReview()
    func dismissVC()
}

class ReviewSlidersVCPresenter: ReviewSlidersVCPresenterProtocol {
    var router: RouterProtocol?
    var imageData: Data?
    var userMarks: [Int]
    
    weak var view: ReviewSlidersVCProtocol?
    
    required init(view: ReviewSlidersVCProtocol, imageData: Data?, userMarks: [Int], router: RouterProtocol) {
        self.view = view
        self.router = router
        self.imageData = imageData
        self.userMarks = userMarks
    }
    
    func showSecondPartOfReview() {
        router?.showSecondPartOfReview(imageData: self.imageData, userMarks: self.userMarks)
    }
    
    func dismissVC() {
        router?.dismissVC()
    }
}
