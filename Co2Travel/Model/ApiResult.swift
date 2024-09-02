//
//  ApiResult.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import Foundation

/// Api Result

struct TransportData: Codable {
    let id: Int
    let name: String
    let value: Double
}

struct ApiResponse: Codable {
    let data: [TransportData]
}

