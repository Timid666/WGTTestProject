//
//  MainVCPresenter.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import Foundation

protocol MainVCProtocol: AnyObject {
    func setupViews()
    func setupContraints()
    func setTripImage()
    func showTripImageUploadingError()
}

protocol MainVCPresenterProtocol: AnyObject {
    init(view: MainVCProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func fetchTripImages()
    func showFirstPartOfReview()
    var router: RouterProtocol? { get set }
    var imageData: Data? { get set }
}

class MainVCPresenter: MainVCPresenterProtocol {
    weak var view: MainVCProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var imageData: Data?
    
    required init(view: MainVCProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        fetchTripImages()
    }
    
    func fetchTripImages() {
        networkService.fetchTripImages { [weak self] responseResult in
            switch responseResult {
            case .success(let data):
                guard let data = data else { return }
                self?.imageData = data
                self?.view?.setTripImage()
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
                self?.view?.showTripImageUploadingError()
            }
        }
    }
    
    func showFirstPartOfReview() {
        router?.showFirstPartOfReview(imageData: self.imageData, userMarks: [2,2,2,2])
    }
}
