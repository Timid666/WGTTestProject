//
//  NetworkService.swift
//  TripReview
//
//  Created by Саид on 19.05.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol: AnyObject {
    func fetchTripImages(completion: @escaping (Result<Data?, Error>) -> ())
    func sendReview(review: ReviewModel, completion: @escaping (Result<String, Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchTripImages(completion: @escaping (Result<Data?, Error>) -> ()) {
        AF.request(Api.imageUrl).response { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            guard let data = response.data else { return }
            completion(.success(data))
            return
        }
    }
    
    func sendReview(review: ReviewModel, completion: @escaping (Result<String, Error>) -> ()) {
        AF.request(Api.destinationUrl, method: .post, parameters: ["someEssense": review]).response { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            print(response.description)
            completion(.success("Ваш отзыв отправлен отправлен"))
        }
    }
}
