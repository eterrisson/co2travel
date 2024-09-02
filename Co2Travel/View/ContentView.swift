//
//  ContentView.swift
//  Co2Travel
//
//  Created by Eric Terrisson on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var starting = false
    
    var body: some View {
        
        if starting {
            // Starting
            TransportView()
            
        } else {
            
            VStack {
                
                // Title
                HStack {
                    Image(systemName: "carbon.dioxide.cloud.fill")
                    Text("Travel")
                }
                .font(.title)
                
                Text("Evaluez la quantité de CO₂ émise par vos déplacements")
                    .font(.body)
                
                // Background
                Image("transport")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Button {
                    self.starting = true
                } label: {
                    HStack {
                        Text("Commencer")
                        Image(systemName: "arrow.forward.circle")
                            
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(Color("lightGreen"))
                    .background(Color("darkGreen"))
                    .cornerRadius(10)
                }
                
                Text("By 🐙ctopus App")
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
