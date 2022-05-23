//
//  Router.swift
//  TripReview
//
//  Created by Саид on 22.05.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: AnyObject, RouterMain {
    func initialViewController()
    func showFirstPartOfReview(imageData: Data?, userMarks: [Int])
    func showSecondPartOfReview(imageData: Data?, userMarks: [Int])
    func dismissVC()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController, let mainVC = assemblyBuilder?.buildMainVC(router: self) else {
            return
        }
        navigationController.viewControllers = [mainVC]
    }
    
    func showFirstPartOfReview(imageData: Data?, userMarks: [Int]) {
        guard let navigationController = navigationController, let reviewSlidersVC = assemblyBuilder?.buildReviewSlidersVC(router: self, imageData: imageData, userMarks: userMarks) else {
            return
        }
        navigationController.present(reviewSlidersVC, animated: true, completion: nil)
    }
    
    func showSecondPartOfReview(imageData: Data?, userMarks: [Int]) {
        guard let navigationController = navigationController, let reviewTextsVC = assemblyBuilder?.buildReviewTextsVC(router: self, imageData: imageData, userMarks: userMarks) else {
            return
        }
        navigationController.showDetailViewController(reviewTextsVC, sender: nil)
    }
    
    func dismissVC() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
