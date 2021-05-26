//
//  SettingsView.swift
//  Portfolio-AppSettings
//
//  Created by Ling on 2021/5/18.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    @State var settingsItem = SettingsItem.sharedData
    @State var showAccountView: Bool = false
    
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                NavigationLink("", destination: AccountView(showSelfView: $showAccountView) , isActive: $showAccountView)
            }.hidden()
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    ForEach(settingsItem, id:\.self.id) { item in
                        sectionHeader(titie: item.title)
                        ForEach(item.contentItem, id:\.self.id) { T in
                            if T.id == 0 {
                                let contentItem = T as! AccountItem
                                settingsItem(icon: contentItem.icon, iconColor: contentItem.iconColor, name: contentItem.name, info: contentItem.info)
                                    .onTapGesture(perform: {
                                        showAccountView.toggle()
                                    })
                                    
                            }else if T.id == 3 {
                                let contentItem = T as! SelectedItem
                                settingsItem(icon: contentItem.icon, iconColor: contentItem.iconColor, title: contentItem.title, select: $isDarkMode)
                            }else {
                                let contentItem = T as! GeneralItem
                                settingsItem(icon: contentItem.icon, iconColor: contentItem.iconColor, title: contentItem.title, select: contentItem.content)
                            } // end if
                        } // end foreach
                    } // end foreach
                }
            }
            .padding(.horizontal)
            
        }
        .navigationBarTitle("Settings", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward").padding()
            }
        }
    } // end body
    
    func sectionHeader(titie: String) -> some View {
        HStack{
            Text(titie).font(.title)
            Spacer()
        }.padding(.vertical).padding(.top)
    }
    
    func settingsItem(icon: String, iconColor: Color, name: String, info: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon).font(.title).padding()
                .foregroundColor(iconColor)
                .background(iconColor.opacity(0.2)).cornerRadius(100)
            VStack {
                Text(name).font(.title3).bold()
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                Text(info).font(.body).foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            }
            Image(systemName: "chevron.right").font(.headline).padding().foregroundColor(Color("chevron_color"))
                .background(Color("chevron_bg_color")).cornerRadius(12).padding(.horizontal)
        }.background(Color("backgroundColor"))
    } // end func
    
    func settingsItem(icon: String, iconColor: Color ,title: String, select: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon).font(.title).padding()
                .foregroundColor(iconColor)
                .background(iconColor.opacity(0.2)).cornerRadius(100)
            
            Text(title).font(.title3).bold()
            
            Spacer()
            Text(select).font(.body).foregroundColor(.gray)
            
            Image(systemName: "chevron.right").font(.headline).padding().foregroundColor(Color("chevron_color"))
                .background(Color("chevron_bg_color")).cornerRadius(12).padding(.horizontal)
        }.background(Color("backgroundColor"))
    } // end func
    
    func settingsItem(icon: String, iconColor: Color ,title: String, select: Binding<Bool>) -> some View {
        HStack(spacing: 20) {
            Image(systemName: icon).font(.title).padding()
                .foregroundColor(iconColor)
                .background(iconColor.opacity(0.2)).cornerRadius(100)
            
                Text(title).font(.title3).bold()
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)

            Toggle(isOn: select, label: {
                Text(select.wrappedValue ? "On" : "Off").font(.body).foregroundColor(.gray)
            }).toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.1799767613, green: 0.1721437275, blue: 0.3238076866, alpha: 1)))).padding()
//            .background(Color.green)
        }.background(Color("backgroundColor"))
    } // end func
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }.preferredColorScheme(.light)
        
        NavigationView {
            SettingsView()
        }.preferredColorScheme(.dark)
    }
}
