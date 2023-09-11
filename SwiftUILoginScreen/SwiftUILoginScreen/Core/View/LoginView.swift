////
////  LoginView.swift
////  SwiftUILoginScreen
////
////  Created by Merugu Anurudh on 07/09/23.
////

import SwiftUI

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToProfile = false
    @State private var showPassword = false

    var body: some View {
        NavigationStack {
            VStack {

                Image("sign-in-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)

                Spacer().frame(height: 10)

                VStack(spacing: 24) {
                    NavigationLink(destination: ProfileView(), isActive: $navigateToProfile) {
                        EmptyView()
                    }
                    InputView(text: $email, title: "Username", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    HStack {
                        InputView(text: $password, title: "Password", placeholder: "Enter Your Password", isSecureField: !showPassword)
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                }
                .padding(.horizontal)

                Spacer().frame(height: 50)

                Button {
                    navigateToProfile = true
                    print(email)
                    print(password)
                } label: {
                    HStack {
                        Text("Login")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)

                Spacer().frame(height: 50) 

                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
            && !password.isEmpty
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


