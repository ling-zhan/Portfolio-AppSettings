//
//  Portfolio_AppSettingsApp.swift
//  Portfolio-AppSettings
//
//  Created by Ling on 2021/5/18.
//

import SwiftUI

@main
struct Portfolio_AppSettingsApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
//                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
