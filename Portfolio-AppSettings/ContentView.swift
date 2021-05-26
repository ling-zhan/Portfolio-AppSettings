//
//  ContentView.swift
//  Portfolio-AppSettings
//
//  Created by Ling on 2021/5/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SettingsView()
                .navigationBarTitle("Helo!", displayMode: .large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.backward")
                        Image(systemName: "checkmark.square.fill")
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
