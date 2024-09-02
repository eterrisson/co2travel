//
//  ApiManager.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import Foundation
import Alamofire

/// Manage API with Alamofire
///
class ApiManager {
    
    let baseURL: String = "https://impactco2.fr/api/v1/transport"
    
    func getTransportCost(km: Int, transport: String) async throws -> ApiResponse {
        
        do {
            let parameters: [String: Any] = [
                "km": km,
                "transports": transport
            ]
            return try await AF.request(baseURL, parameters: parameters).serializingDecodable(ApiResponse.self).value
        } catch {
            throw error
        }
    }
}
