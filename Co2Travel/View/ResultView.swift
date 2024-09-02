//
//  ResultView.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var transportVM: TransportViewModel
    
    @State private var offsetX: CGFloat = 0.0
    @State private var gaugeWidth: CGFloat = 0.0
    @State private var currentKm: Int = 0 // Valeur actuelle animée
    @State private var currentCo2: Double = 0.0 // Valeur actuelle animée
    
    
    let animationDuration: Double = 5.0 // Durée de l'animation en secondes
    
    var body: some View {
        
        VStack {
            if transportVM.status == .loaded && transportVM.transportData?.name != nil && transportVM.transportData?.value != nil {
                VStack {
                    GeometryReader { geometry in
                        VStack {
                            HStack {
                                
                                ZStack {
                                    Color.pink
                                        .frame(width: gaugeWidth, height: 5)
                                        .animation(.linear(duration: animationDuration), value: gaugeWidth)
                                    
                                    Image(systemName: transportVM.transportMode.sfSymbolName)
                                        .offset(x: offsetX, y: 0.0)
                                        .animation(.linear(duration: animationDuration), value: offsetX)
                                }
                                
                                Spacer()
                            }
                            .onAppear {
                                startImageAnimation(maxWidth: geometry.size.width)
                            }
                            
                            
                            //MoveView(imageName: transportVM.transportMode.sfSymbolName)
                            
                            Text("\(currentKm) Km")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            Text("\(currentCo2, specifier: "%.2f") Kg de CO₂")
                                .font(.title)
                                .foregroundColor(Color("darkGreen"))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("lightGreen"))
                        .onAppear {
                            startKmAnimation()
                            startCo2Animation()
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    private func startImageAnimation(maxWidth: CGFloat) {
        // Décale l'image en fonction de la largeur de l'écran
        offsetX = maxWidth - 220
        gaugeWidth = maxWidth - 60
    }
    
    private func startKmAnimation() {
        
        //isAnimating = true
        currentKm = 0
        
        if let targetKm = Int(transportVM.distanceKm) {
            let stepTime: Double = animationDuration / Double(targetKm)
            let increment: Int = 1
            
            // Timer pour mettre à jour la valeur à chaque pas
            Timer.scheduledTimer(withTimeInterval: stepTime, repeats: true) { timer in
                currentKm += increment
                if currentKm >= targetKm {
                    currentKm = targetKm // Assurez-vous que ça n'excède pas la valeur cible
                    timer.invalidate()
                    //isAnimating = false
                }
            }
        }
    }
    
    private func startCo2Animation() {
        
        //isAnimating = true
        currentCo2 = 0.0
        
        if let data = transportVM.transportData {
            let targetCo2 = data.value
            let stepTime: Double = animationDuration / targetCo2
            let increment: Double = 1.0
            
            // Timer pour mettre à jour la valeur à chaque pas
            Timer.scheduledTimer(withTimeInterval: stepTime, repeats: true) { timer in
                currentCo2 += increment
                if currentCo2 >= targetCo2 {
                    currentCo2 = targetCo2 // Assurez-vous que ça n'excède pas la valeur cible
                    timer.invalidate()
                    //isAnimating = false
                }
            }
        }
    }
}
