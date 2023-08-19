//
//  OnBoardTw.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-08.
//

import SwiftUI

struct OnBoardTwo: View {
    
    
    @State private var age = Date()
    @AppStorage("age_key") var ageStore = 0
    @AppStorage("name_key") var nameStore = ""
    
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    var calculatedAge: Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let ageComponents = calendar.dateComponents([.year], from: age, to: currentDate)
        return ageComponents.year ?? 0
    }
    
    var isValidAge: Bool {
        let minAge = 12
        let maxAge = 100
        return calculatedAge >= minAge && calculatedAge < maxAge
    }
    
    var body: some View {
        
        ZStack{
            Color(red: 250/255, green: 255/255, blue: 255/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Step 2/3")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .padding(.top, 20)
                
                ProgressView(value: 0.6)
                    .tint(Color(red: 16/255, green: 44/255, blue: 87/255))
                    .padding(.top)
                    .padding(.horizontal, 30)
                
                Text("What is your age?")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .light, design: .default))
                    .padding(.top, 30)
                    .padding(10)
                
                DatePicker("", selection: $age, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .offset(x: -28, y: 40)
                    .padding(.top, -20)
           
                
                Text("\(calculatedAge) years")
                    .foregroundColor(isValidAge ? .black : .red) // Change text color based on validity
                    .font(.system(size: 35, weight: .semibold, design: .default))
                    .padding(.top, 50)
                
                Image("free")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                
                Spacer()
                
            }
            .offset(y: -51)
            
            VStack{
                Spacer()
                
                NavigationLink(destination: OnBoardThree(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
                
                Button("Next") {
                    if isValidAge{
                        ageStore = calculatedAge
                        print(ageStore)
                        print(nameStore)
                        showAlert = false
                        showNavigationToNextView = true
                        
                    } else {
                        showAlert = true
                        
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
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Warning!"), message: Text("Age should be between 12 and 100"), dismissButton: .default(Text("OK")))
        }.accentColor(Color(.label))
    }
    
}

struct OnBoardTw_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardTwo()
    }
}
