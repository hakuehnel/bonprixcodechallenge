//
//  EmptyBasketView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import SwiftUI

struct EmptyBasketView: View {
    @Binding var login: Bool
    
    // MARK: - body
    var body: some View {
        VStack {
            Image(systemName: "bag")
                .font(.system(size: 32))
            Text("0 Artikel")
            Text("Deine Einkaufstasche ist leer")
                .font(.system(size: 26))
            Text("Vermisst du Artikel in Deiner Tasche?")
            Button {
                login.toggle()
            } label: {
                Text("Zum Login")
                    .bonprixRedText()
            }
        }
        .bonprixRegularText()
        .sheet(isPresented: $login) {
            LoginView(login: $login)
                .padding()
        }
    }
}

struct EmptyBasketView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBasketView(login: .constant(false))
    }
}
