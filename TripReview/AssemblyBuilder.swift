//
//  Builder.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func buildMainVC(router: RouterProtocol) -> UIViewController
    func buildReviewSlidersVC(router: RouterProtocol, imageData: Data?, userMarks: [Int]) -> UIViewController
    func buildReviewTextsVC(router: RouterProtocol, imageData: Data?, userMarks: [Int]) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func buildMainVC(router: RouterProtocol) -> UIViewController {
        let vc = MainVC()
        let networkService = NetworkService()
        let presenter = MainVCPresenter(view: vc, networkService: networkService, router: router)
        vc.presenter = presenter
        return vc
    }
    
    func buildReviewSlidersVC(router: RouterProtocol,imageData: Data?, userMarks: [Int]) -> UIViewController {
        let vc = ReviewSlidersVC()
        vc.view.backgroundColor = .white
        let presenter = ReviewSlidersVCPresenter(view: vc, imageData: imageData, userMarks: userMarks, router: router)
        vc.presenter = presenter
        return vc
    }
    
    func buildReviewTextsVC(router: RouterProtocol,imageData: Data?, userMarks: [Int]) -> UIViewController {
        let vc = ReviewTextsVC()
        let networkService = NetworkService()
        vc.view.backgroundColor = .white
        let presenter = ReviewTextsPresenter(view: vc, networkService: networkService, image: imageData, userMarks: userMarks, router: router)
        vc.presenter = presenter
        return vc
    }
}
