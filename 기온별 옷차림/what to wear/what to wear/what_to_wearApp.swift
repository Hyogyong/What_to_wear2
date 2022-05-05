//
//  what_to_wearApp.swift
//  what to wear
//
//  Created by 이효경 on 2022/04/27.
//

import SwiftUI

@main
struct what_to_wearApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
