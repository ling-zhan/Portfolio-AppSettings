//
//  DateStruct.swift
//  Portfolio-AppSettings
//
//  Created by Ling on 2021/5/21.
//

import SwiftUI

protocol Item {
    var id: Int { get set }
    var icon: String { get set }
    var iconColor: Color { get set }
}

struct AccountItem: Item {
    var id: Int
    var icon: String
    var iconColor: Color
    let name: String
    let info: String
}

struct GeneralItem: Item {
    var id: Int
    var icon: String
    var iconColor: Color
    let title: String
    let content: String
}

struct SelectedItem: Item {
    var id: Int
    var icon: String
    var iconColor: Color
    let title: String
}

struct SettingsItem {
    let id = UUID()
    let title: String
    var contentItem: [Item]
    
    static var sharedData: [SettingsItem] = [
        SettingsItem(title: "Account", contentItem: [AccountItem(id: 0, icon: "person.fill", iconColor: Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)), name: "David Clerisseau", info: "Personal Info")]),
        SettingsItem(title: "Settings", contentItem: [
            GeneralItem(id: 1, icon: "network", iconColor: Color(#colorLiteral(red: 0.9900167584, green: 0.419403553, blue: 0.1353556514, alpha: 1)), title: "Language", content: "English"),
            GeneralItem(id: 2, icon: "bell.fill", iconColor: Color(#colorLiteral(red: 0.104474701, green: 0.641841352, blue: 0.9215877652, alpha: 1)), title: "Notifications", content: ""),
            SelectedItem(id: 3, icon: "moon.fill", iconColor: Color(#colorLiteral(red: 0.3347758055, green: 0.1938542128, blue: 0.9748181701, alpha: 1)), title: "Dark Mode"),
            GeneralItem(id: 4, icon: "lifepreserver", iconColor: Color(#colorLiteral(red: 0.9811869264, green: 0.1562995613, blue: 0.3455670178, alpha: 1)), title: "Language", content: "English"),
        ])
    ]
}
