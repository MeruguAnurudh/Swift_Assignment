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
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Text("Sign In")
                        .font(.system(size: 40))
                    
                    Spacer().frame(height: 20)
                    
                    VStack(spacing: 35) {
                        NavigationLink(destination: ProfileView(), isActive: $navigateToProfile) {
                            EmptyView()
                        }
                        InputView(text: $email, placeholder: "Username")
                            .autocapitalization(.none)
                            .padding(.bottom, -20)
                        
                        Divider().background(.black)
                        HStack {
                            InputView(text: $password, placeholder: "Password", isSecureField: !showPassword)
                                .padding(.bottom, -30)
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8)
                            .padding(.bottom, -30)
                        }
                        Divider().background(.black)
                    }
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 60)
                    
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
                        .frame(width: UIScreen.main.bounds.width - 182, height: 48)
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







