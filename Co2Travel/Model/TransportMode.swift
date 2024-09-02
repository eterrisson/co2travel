//
//  TransportMode.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import Foundation

import SwiftUI

enum TransportMode: Int, CaseIterable, Identifiable {
    case avion = 1
    case tgv = 2
    case intercites = 3
    case voitureThermique = 4
    case voitureElectrique = 5
    case autocar = 6
    case veloOuMarche = 7
    case veloAssistanceElectrique = 8
    case busThermique = 9
    case tramway = 10
    case metro = 11
    case scooterOuMotoLegere = 12
    case moto = 13
    case rerOuTransilien = 14
    case ter = 15
    case busElectrique = 16
    case trottinetteAssistanceElectrique = 17
    case busGNV = 21
    case covoiturageThermique1Passager = 22
    case covoiturageThermique2Passagers = 23
    case covoiturageThermique3Passagers = 24
    case covoiturageThermique4Passagers = 25
    case covoiturageElectrique1Passager = 26
    case covoiturageElectrique2Passagers = 27
    case covoiturageElectrique3Passagers = 28
    case covoiturageElectrique4Passagers = 29
    
    // Propriétés calculées pour obtenir le nom et le SF Symbol correspondant
    var sfSymbolName: String {
        switch self {
        case .avion:
            return "airplane"
        case .tgv, .intercites, .rerOuTransilien, .ter:
            return "train.side.front.car"
        case .voitureThermique, .covoiturageThermique1Passager, .covoiturageThermique2Passagers, .covoiturageThermique3Passagers, .covoiturageThermique4Passagers:
            return "car.fill"
        case .voitureElectrique, .covoiturageElectrique1Passager, .covoiturageElectrique2Passagers, .covoiturageElectrique3Passagers, .covoiturageElectrique4Passagers:
            return "car.fill"
        case .autocar:
            return "bus.fill"
        case .veloOuMarche:
            return "figure.walk"
        case .veloAssistanceElectrique:
            return "bicycle"
        case .busThermique:
            return "bus"
        case .tramway:
            return "tram.fill"
        case .metro:
            return "tram.fill"
        case .scooterOuMotoLegere:
            return "scooter"
        case .moto:
            return "motorcycle"
        case .busElectrique:
            return "bus"
        case .trottinetteAssistanceElectrique:
            return "scooter"
        case .busGNV:
            return "bus"
        }
    }
    
    var name: String {
        switch self {
        case .avion:
            return "Avion"
        case .tgv:
            return "TGV"
        case .intercites:
            return "Intercités"
        case .voitureThermique:
            return "Voiture thermique"
        case .voitureElectrique:
            return "Voiture électrique"
        case .autocar:
            return "Autocar"
        case .veloOuMarche:
            return "Vélo ou marche"
        case .veloAssistanceElectrique:
            return "Vélo à assistance électrique"
        case .busThermique:
            return "Bus thermique"
        case .tramway:
            return "Tramway"
        case .metro:
            return "Métro"
        case .scooterOuMotoLegere:
            return "Scooter ou moto légère"
        case .moto:
            return "Moto"
        case .rerOuTransilien:
            return "RER ou Transilien"
        case .ter:
            return "TER"
        case .busElectrique:
            return "Bus électrique"
        case .trottinetteAssistanceElectrique:
            return "Trottinette à assistance électrique"
        case .busGNV:
            return "Bus (GNV)"
        case .covoiturageThermique1Passager:
            return "Covoiturage thermique (1 passager)"
        case .covoiturageThermique2Passagers:
            return "Covoiturage thermique (2 passagers)"
        case .covoiturageThermique3Passagers:
            return "Covoiturage thermique (3 passagers)"
        case .covoiturageThermique4Passagers:
            return "Covoiturage thermique (4 passagers)"
        case .covoiturageElectrique1Passager:
            return "Covoiturage électrique (1 passager)"
        case .covoiturageElectrique2Passagers:
            return "Covoiturage électrique (2 passagers)"
        case .covoiturageElectrique3Passagers:
            return "Covoiturage électrique (3 passagers)"
        case .covoiturageElectrique4Passagers:
            return "Covoiturage électrique (4 passagers)"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
