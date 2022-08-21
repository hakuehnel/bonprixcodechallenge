//
//  MyBonprix.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct MyBonprix: View {
    @State var login: Bool = false
    
    // MARK: - body
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    login.toggle()
                } label: {
                    ZStack {
                        Color.bonprixRed
                            .cornerRadius(8)
                        Text("Anmelden")
                            .foregroundColor(.white)
                            .font(.bonprixMedium)
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                }

                Form {
                    Section {
                        Text("Mein Konto")
                        Text("Meine Bestellungen")
                    } header: {
                        Text("Kontoübersicht")
                    }
                    Section {
                        Text("Unsere Serviceleistungen")
                        Text("Beratungen")
                    } header: {
                        Text("Kundenservice")
                    }
                }
                .bonprixRegularText()
            }
            .navigationBarTitle("Mein bonprix")
        }
        .sheet(isPresented: $login) {
            LoginView(login: $login)
                .accentColor(.bonprixRed)
                .padding()
        }
    }
}

struct MyBonprix_Previews: PreviewProvider {
    static var previews: some View {
        MyBonprix()
    }
}
