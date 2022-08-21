//
//  LoginView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import SwiftUI

struct LoginView: View {
    @Binding var login: Bool
    
    // MARK: - state properties
    @State var isAlreadyRegistered = true
    @State var forgotPassword = false
    
    // MARK: - body
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(isAlreadyRegistered ? "Sign in" : "Create Account")
                    .font(.system(size: 30).bold())
                Text("User Name")
                    .fontWeight(.semibold)
                TextField("username", text: .constant(""))
                
                Divider()
                
                Text("Password")
                    .fontWeight(.semibold)
                SecureField("Password", text: .constant(""))
                
                Divider()
                
                HStack {
                    Spacer()
                    Button {
                        forgotPassword.toggle()
                    } label: {
                        Text("Forgot password?")
                    }
                }
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .font(.system(size: 24).bold())
                    }
                }
                HStack {
                    Spacer()
                    Text(isAlreadyRegistered ? "No Member?" : "Already Registered?")
                        .foregroundColor(.gray)
                    Button {
                        withAnimation {
                            isAlreadyRegistered.toggle()
                        }
                    } label: {
                        Text(!isAlreadyRegistered ? "Login" : "Sign up")
                    }
                    Spacer()
                }
            } // VStack
            .foregroundColor(.bonprixRed)
            .font(.bonprixRegular)
        }
        .sheet(isPresented: $forgotPassword) {
            Button {
                forgotPassword.toggle()
            } label: {
                Text("Dismiss")
                    .bonprixRedText()
            }

        } // sheet
    } // ZStack
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(login: .constant(true))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
