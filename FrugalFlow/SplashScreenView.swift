//
//  SplashScreenView.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-12.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct SplashScreenView: View {
    @AppStorage("register_key") var register = false
    @State private var nextView = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top)
                        
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1.2
                        self.opacity = 1.0
                    }
                }
                
                if register {
                    NavigationLink(destination: TabBarView(), isActive: $nextView) {
                        EmptyView()
                    }
                } else {
                    NavigationLink(destination: OnBoardOneView(), isActive: $nextView) {
                        EmptyView()
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    nextView = true // Activate the navigation link
                }
            }
        }.accentColor(Color(.label))
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
