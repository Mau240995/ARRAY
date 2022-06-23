//
//  ContentView.swift
//  PRUEBA
//
//  Created by user217123 on 6/7/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth  = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){
    [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password)
        auth.createUser(withEmail: email, password: password){
            [weak self] result, error in
            guard result != nil, error ==  nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}
//
struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                Text("Estas registrado")
            }else{
                SignInView()
            }
        }
        //.navigationBarTitle("BancoAzteca")
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
        }
    }
struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
    
            VStack {
                Text("Bienvenido")
                    .font(.title)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)

                Image("logotipo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 250)
                VStack{
                    TextField("Email Address",text: $email).keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(8)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                    .padding(.horizontal,60)
                    
                
                SecureField("Password",text: $password)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).padding(8)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3)).cornerRadius(6)
                    .padding(.horizontal, 60)
                    .padding(.top,10)
                    
                   
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label:{
                        Text("Login")
                            .foregroundColor(Color.white)
                            //.frame(width: 100, height: 50)
                            .padding(10)
                            .font(.system(size:30))
                            .background(Color.green)
                            .cornerRadius(10)
                            
                    })
                    NavigationLink("Crear Cuenta",destination: SignUpView())
                    .padding()
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Login")

    }
        
}

//
struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
            VStack {
                Text("Bienvenido")
                    .font(.title)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)

                Image("logotipo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 250)
                VStack{
                    TextField("Email Address",text: $email)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(8)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                    .padding(.horizontal,60)
                    
                
                SecureField("Password",text: $password)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).padding(8)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3)).cornerRadius(6)
                    .padding(.horizontal, 60)
                    .padding(.top,10)
                    
                   // .padding(60)
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    }, label:{
                        Text("Crear Cuenta")
                            .foregroundColor(Color.white)
                        
                            .padding(10)
                            .font(.system(size:30))
                            .background(Color.green)
                            .cornerRadius(10)
                            
                    })
                }
                .padding()
                Spacer()
            }
            .navigationBarTitle("Crear Cuenta")

    }
        
}///
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

