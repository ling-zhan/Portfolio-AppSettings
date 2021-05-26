//
//  AccountView.swift
//  Portfolio-AppSettings
//
//  Created by Ling on 2021/5/18.
//

import SwiftUI

struct AccountView: View {
    @Binding var showSelfView: Bool
    
    @State var name: String = ""
    @State var age: String = ""
    @State var email: String = ""
    @State var gender: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("backgroundColor").edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 50) {
                        photoItem(title: "Photo", size: geometry.size)
                        textFieldItem(title: "Name", text: $name, size: geometry.size)
                        genderItem(title: "Gender", size: geometry.size)
                        textFieldItem(title: "Age", text: $age, size: geometry.size)
                        textFieldItem(title: "Email", text: $email, size: geometry.size)
                    }.padding(.top,40)
                }
                
                
            }
        }
        .navigationBarTitle("Account", displayMode: .large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "checkmark")
                    .font(.body).foregroundColor(.white)
                    .padding(10).background(Color(#colorLiteral(red: 0.1220640466, green: 0.7260920405, blue: 0.9838952422, alpha: 1))).cornerRadius(12)
            }
        } // end toolbar
    } // end body
    
    func photoItem(title: String, size: CGSize)-> some View {
        HStack(alignment: .top) {
            Text(title).font(.body)
                .frame(width: size.width / 3, alignment: .leading).padding(.leading)
            VStack {
                Image(systemName: "person.fill").font(.largeTitle).padding()
                    .foregroundColor(Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)))
                    .background(Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)).opacity(0.2)).cornerRadius(100)
                Text("Upload Image").font(.body).foregroundColor(Color(#colorLiteral(red: 0, green: 0.6909903884, blue: 0.9821589589, alpha: 1))).padding()
            }.frame(minWidth: 0, maxWidth: .infinity).padding(.trailing)
        }
    }
    
    func genderItem(title: String, size: CGSize)-> some View {
        HStack(alignment: .top) {
            Text(title).font(.body)
                .frame(width: size.width / 3, alignment: .leading).padding(.leading)
            HStack(spacing: 20) {
                Image("male")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(gender == 0 ? .white : Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)))
                    .padding()
                    .background(gender == 0 ? Color(#colorLiteral(red: 0.3385438621, green: 0.1984573603, blue: 0.9788376689, alpha: 1)) : Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)).opacity(0.2))
                    .cornerRadius(100)
                    .onTapGesture(perform: {
                        self.gender = 0
                    })
                Image("female").resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(gender == 1 ? .white : Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)))
                    .padding()
                    .background(gender == 1 ? Color(#colorLiteral(red: 0.3385438621, green: 0.1984573603, blue: 0.9788376689, alpha: 1)) : Color(#colorLiteral(red: 0.7176470588, green: 0.7294117647, blue: 0.7803921569, alpha: 1)).opacity(0.2))
                    .cornerRadius(100)
                    .onTapGesture(perform: {
                        self.gender = 1
                    })
            }.frame(minWidth: 0, maxWidth: .infinity).padding(.trailing)
        }
    }
    
    func textFieldItem(title: String, text: Binding<String>, size: CGSize)-> some View {
        HStack(alignment: .top) {
            Text(title).font(.body)
                .frame(width: size.width / 3, alignment: .leading).padding(.leading)
            VStack {
                TextField("Enter your name", text: text)
                Divider()
            }.frame(minWidth: 0, maxWidth: .infinity).padding(.trailing)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView(showSelfView: .constant(true))
        }.preferredColorScheme(.light)
        
        NavigationView {
            AccountView(showSelfView: .constant(true))
        }.preferredColorScheme(.dark)
    }
}
