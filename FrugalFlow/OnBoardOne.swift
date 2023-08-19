//
//  ContentView.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-08.
//

import SwiftUI

struct OnBoardOneView: View {
    
    @AppStorage("name_key") var nameStore = ""
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    var body: some View {
        
        ZStack{
            Color(red: 250/255, green: 255/255, blue: 255/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Step 1/3")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .padding(.top, 20)
                
                ProgressView(value: 0.3)
                    .tint(Color(red: 16/255, green: 44/255, blue: 87/255))
                    .padding(.top)
                    .padding(.horizontal, 30)
                
                Text("Hello there!")
                    .foregroundColor(Color(red: 16/255, green: 44/255, blue: 87/255))
                    .font(.system(size: 28, weight: .semibold, design: .default))
                    .padding(.top, 30)
                
                Text("What is your name?")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .light, design: .default))
                    .padding(.top, 30)
                    .padding(10)
                
                TextField("Enter name", text: $nameStore)
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .frame(width: 280, height: 80)
                    .border(Color.black, width: 0.5)
                    .padding(.top, 60)
                    .autocorrectionDisabled()
                
                Image("free")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                
                
                Spacer()
                
                NavigationLink(destination: OnBoardTwo(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
                
                
                Button("Next") {
                    if nameStore.isEmpty {
                        
                        showAlert = true
                        
                    } else {
                        print(nameStore)
                        showAlert = false
                        showNavigationToNextView = true
                    }
                }
                .frame(width: 280, height: 60)
                .background(Color(red: 16/255, green: 44/255, blue: 87/255))
                .font(.system(size: 28, weight: .semibold))
                .multilineTextAlignment(.center)
                .cornerRadius(15)
                .padding(.top)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Warning!"), message: Text("Name cannot be empty"), dismissButton: .default(Text("OK")))
                
            
            
            
        }.accentColor(Color(.label))
            .navigationBarBackButtonHidden()
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardOneView()
    }
}

