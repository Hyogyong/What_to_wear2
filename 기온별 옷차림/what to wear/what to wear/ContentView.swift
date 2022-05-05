//
//  ContentView.swift
//  what to wear
//
//  Created by 이효경 on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        MainPageView()
            .environmentObject(network)
            .onAppear {
                network.getWeather()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
