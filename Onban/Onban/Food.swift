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

enum  HeaderMessages: CaseIterable {
    case main
    case soup
    case side
    
    var kind: String {
        String(describing: self)
    }
}

extension HeaderMessages: CustomStringConvertible {
    var description: String {
        switch self {
        case .main:
            return "온 가족이 좋아하는 든든한 메인 요리"
        case .soup:
            return "정성과 건강이 가득 담긴 국물 요리"
        case .side:
            return "식탁을 풍성하게 하는 정갈한 밑반찬"
        }
    }
}
