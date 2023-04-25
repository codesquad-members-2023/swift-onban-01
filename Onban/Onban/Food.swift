//
//  Food.swift
//  Onban
//
//  Created by ilim on 2023/04/24.
//

import Foundation

struct Food: Codable {
    let detailHash: String
    let imageUrl: String
    let title: String
    let description: String
    let normalPrice: String?
    let salePrice: String
    let badge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case title, description, badge
        case imageUrl = "image"
        case detailHash = "detail_hash"
        case normalPrice = "n_price"
        case salePrice = "s_price"
    }
}

struct FoodResponse: Codable {
    let statusCode: Int
    let body: [Food]
}


