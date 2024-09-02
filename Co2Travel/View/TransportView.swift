//
//  CategoriesView.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import SwiftUI

struct TransportView: View {
    
    @StateObject var transportVM: TransportViewModel = TransportViewModel()
    
    @State private var selectedTransportMode: TransportMode = .avion
    @State private var distanceKm: String = ""
    @State private var isAnimating = false // button animation
    
    var body: some View {
        NavigationStack {
            Group {
                
                // Resume choice
                
                HStack {
                    if !distanceKm.isEmpty {
                            Spacer()
                            Image(systemName: selectedTransportMode.sfSymbolName)
                                .foregroundColor(Color("darkGreen"))
                                .font(.title)
                            Text("\(selectedTransportMode.name) sur \(distanceKm) km")
                                .font(.headline)
                                .foregroundColor(Color("darkGreen"))
                        Spacer()
                    } else {
                        Color.clear
                    }
                }
                .frame(height: 80)
                .background(Color("lightGreen"))
                
                // Transport mode selection
                
                Text("Mode de transport")
                    .font(.title2)
                    .foregroundColor(Color("darkGreen"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .frame(height: 3)
                    .background(Color("darkGreen"))
                
                Picker("TransportMode", selection: $selectedTransportMode) {
                    ForEach(TransportMode.allCases) { mode in
                        HStack {
                            Image(systemName: mode.sfSymbolName)
                                .foregroundColor(Color("darkGreen"))
                            Text(mode.name)
                        }
                        .tag(mode)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                // KM
                
                Text("Distance")
                    .font(.title2)
                    .foregroundColor(Color("darkGreen"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .frame(height: 3)
                    .background(Color("darkGreen"))
                
                HStack {
                    Text("Km")
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("darkGreen"))
                        .background(Color("lightGreen"))
                        .cornerRadius(10)
                    TextField("Entrez la distance en kilomètres", text: $distanceKm)
                        .keyboardType(.numberPad) // Utiliser le clavier numérique pour les entrées de nombres
                        .frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                Spacer()
                
                // Calculate
                
                Button {
                    isAnimating = true
                    calculateCost()
                } label: {
                    HStack {
                        Text("Calculer")
                        Image(systemName: "transmission")
                            .rotationEffect(Angle.degrees(isAnimating ? 360 : 0))
                            .animation(isAnimating ? Animation.linear(duration: 3).repeatForever(autoreverses: false) : .default, value: isAnimating)
                    }
                    .font(.title)
                    .padding()
                    .foregroundColor(Color("lightGreen"))
                    .background(Color("darkGreen"))
                    .cornerRadius(10)
                }
                .background(
                    NavigationLink( // Navigate to result view
                        destination: ResultView(transportVM: transportVM),
                        isActive: $transportVM.navigateToResult,
                        label: { EmptyView() }
                    )
                )
                
                // Error
                
                if transportVM.status == .error {
                        Text("Erreur de récupération des données. Veuillez réessayer.")
                            .padding()
                            .foregroundColor(.white)
                            .background(.gray)
                }
            }
            .onAppear {
                transportVM.navigateToResult = false
                isAnimating = false
            }
        }
    }
    
    private func calculateCost() {
        // Km to Int
        if let kmInt = Int(distanceKm) {
            self.transportVM.distanceKm = self.distanceKm
            self.transportVM.transportMode = self.selectedTransportMode
            let modeString = String(selectedTransportMode.id)
            transportVM.getResult(km: kmInt, transport: modeString)
        } else {
            // todo: focus sur km et message d'erreur
            print("erreur de conversion km")
        }
    }
}

struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        TransportView()
    }
}
