//
//  ReviewModel.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

struct ReviewModel: Codable {
    let id: Int
    let totalOpinion: Int
    let mark: Int
    let informativeInfo: Int
    let navigationСonvenient: Int
    let firstDesctiption: String
    let secondDescription: String
}
