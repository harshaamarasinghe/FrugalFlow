//
//  EducationView.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-13.
//

import SwiftUI

struct EducationView: View {
    var body: some View {
        ZStack{
            Color(red: 250/255, green: 250/255, blue: 250/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Let's Learn")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.top)
                
                
                VStack{
                    
                    HStack(spacing: 7){
                        Image("1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("Minimalism Netflix Documentry")
                                .fontWeight(.semibold)
                            
                            Link("Click here to watch", destination: URL(string: "https://youtu.be/J8DGjUv-Vjc")!).foregroundColor(.gray)
                            
                        }
                        
                    }.frame(width: 350)
                        .background(.white)
                        .cornerRadius(12)
                    
                    HStack(spacing: 7){
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("20 Things I don't Buy Anymore")
                                .fontWeight(.semibold)
                            
                            Link("Click here to watch", destination: URL(string: "https://youtu.be/44d1Zn36d1o")!).foregroundColor(.gray)
                            
                        }
                        
                    }.frame(width: 350)
                        .background(.white)
                        .cornerRadius(12)
                    
                    HStack(spacing: 7){
                        Image("3")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("My Journey To Become Minimalist")
                                .fontWeight(.semibold)
                            
                            Link("Click here to watch", destination: URL(string: "https://youtu.be/qOErL8Uu6Fg")!).foregroundColor(.gray)
                            
                        }
                        
                    }.frame(width: 350)
                        .background(.white)
                        .cornerRadius(12)
                    
                    HStack(spacing: 7){
                        Image("5")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("Why I Became a Minimalist...")
                                .fontWeight(.semibold)
                            
                            Link("Click here to watch", destination: URL(string: "https://youtu.be/KXsqyp08dTI")!).foregroundColor(.gray)
                            
                        }
                        
                    }.frame(width: 350)
                        .background(.white)
                        .cornerRadius(12)
                    
                    HStack(spacing: 7){
                        Image("4")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("5 Frugal Mindsets to Save Money")
                                .fontWeight(.semibold)
                            
                            Link("Click here to watch", destination: URL(string: "https://youtu.be/dhbMsy_Lgyo")!).foregroundColor(.gray)
                            
                        }
                        
                    }.frame(width: 350)
                        .background(.white)
                        .cornerRadius(12)
                    
                    
                }
                
                Spacer()
                
            }
        }
    }
}

struct EducationView_Previews: PreviewProvider {
    static var previews: some View {
        EducationView()
    }
}
