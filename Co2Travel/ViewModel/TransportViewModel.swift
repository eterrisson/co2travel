//
//  TransportViewModel.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import Foundation

class TransportViewModel: ObservableObject {
    
    @Published var status: RequestStatus = .initial
    @Published var transportData: TransportData?
    @Published var navigateToResult: Bool = false // navigation
    @Published var distanceKm: String = ""
    @Published var transportMode: TransportMode = .avion
    
    let apiManager = ApiManager()
    
    enum RequestStatus {
        case initial, loading, loaded, error
    }
    
    func getResult(km: Int, transport: String) {
        self.status = .loading
        Task {
            do {
                let result = try await apiManager.getTransportCost(km: km, transport: transport)
                DispatchQueue.main.async {
                    self.transportData = result.data[0]
                    self.status = .loaded
                    self.navigateToResult = true
                }
            } catch {
                // Gérez les erreurs ici
                print("Erreur: \(error)")
                DispatchQueue.main.async {
                    self.status = .error
                }
            }
        }
    }
}
