//
//  LoginPage.swift
//  TranscribeAI
//
//  Created by ABPersonal on 16/01/23.
//

import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                
                TextField("Username", text: $username)
                    .padding()
                    .border(Color.gray)
                
                SecureField("Password", text: $password)
                    .padding()
                    .border(Color.gray)
                
                NavigationLink(destination: TranscriptionPage()){
                    //                Button(action: {
                    //                    // Perform login action
                    //                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(40)
                    //                }
                    
                    
                }
                
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
