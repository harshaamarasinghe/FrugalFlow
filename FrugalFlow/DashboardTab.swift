//
//  DashboardTab.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-09.
//

import SwiftUI
import SwiftUICharts

struct DashboardTab: View {
    
    @State private var month : String
    
    @AppStorage("expense_food") var food = 0.00
    @AppStorage("expense_healthcare") var healthcare = 0.00
    @AppStorage("expense_transportation") var transportation = 0.00
    @AppStorage("expense_shopping") var shopping = 0.00
    @AppStorage("expense_payments") var payments = 0.00
    @AppStorage("expense_saving") var saving = 0.00
    
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("expence_key") var expenseStore = 0.00
    
    var calSalary: Float{
        var balance = 0.00
        var bar = 0.00
        balance = salaryStore - taxStore - expenseStore
        //bar = ((balance/salaryStore)*100)
        return Float(balance)
    }
    
    var calSalaryPercent: Float{
        var balance = 0.00
        var bar = 0.00
        balance = salaryStore - taxStore - expenseStore
        bar = ((balance/salaryStore)*100)
        return Float(bar/100)
    }
    
    init() {
        let currentDate = Date()
        let calendar = Calendar.current
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        self._month = State(initialValue: monthFormatter.string(from: currentDate))
        
        if month != UserDefaults.standard.string(forKey: "storedMonth") {
            // Reset the expense values to zero
            food = 0.00
            healthcare = 0.00
            transportation = 0.00
            shopping = 0.00
            payments = 0.00
            saving = 0.00
            expenseStore = 0.00
            
            // Store the current month for future comparisons
            UserDefaults.standard.set(month, forKey: "storedMonth")
        }
        
    }
    var body: some View {
        
        ZStack{
            
            
            Color(red: 250/255, green: 250/255, blue: 250/255)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(month)
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.bottom , 10)
                
                Text("Remaining Salary Rs.\(Int(calSalary))")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(.bottom , 10)
                
                ProgressView(value: calSalaryPercent)
                    .tint(Color(red: 0/255, green: 0/255, blue: 0/255))
                    .padding(.bottom, 30)
                    .padding(.horizontal, 30)
                
                
                VStack{
                    
                    Pie(
                        
                        food: food,
                        healthcare: healthcare,
                        transportation: transportation,
                        shopping: shopping,
                        payments: payments,
                        saving: saving
                        
                    )
                    
                    HStack{
                        
                        NavigationLink(destination: AddExpense(), label: {
                            Text("Add Expense")
                                .frame(width: 300, height: 60)
                                .background(Color(red: 16/255, green: 44/255, blue: 87/255))
                                .font(.system(size: 28, weight: .bold))
                                .multilineTextAlignment(.center)
                                .cornerRadius(15)
                                .padding(.top)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        })
                    }.padding(.top)
                    
                }.padding(.bottom)
            }.padding(.top)
            
        }
        
    }
    
}

struct DashboardTab_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTab()
    }
}

struct PieModel: Identifiable{
    let id = UUID()
    var value: Double
    var color: Color
    var name: String
}




struct Pie: View {
    var food: Double
    var healthcare: Double
    var transportation: Double
    var shopping: Double
    var payments: Double
    var saving: Double
    
    var body: some View {
        VStack {
            let total = food + healthcare + shopping + saving + transportation + payments
            let slices: [PieModel] = [
                .init(value: food, color: Color.orange, name: "Food"),
                .init(value: healthcare, color: Color.blue, name: "Healthcare"),
                .init(value: transportation, color: Color.yellow, name: "Transportation"),
                .init(value: shopping, color: Color.green, name: "Shopping"),
                .init(value: payments, color: Color.purple, name: "Payments"),
                .init(value: saving, color: Color.red, name: "Savings")
            ]
            
            Canvas { context, size in
                context.translateBy(x: size.width/2, y: size.height/2)
                var pieContext = context
                pieContext.rotate(by: .degrees(90))
                let radius = min(size.width, size.height) * 0.45
                var startAngle = Angle.zero
                
                for slice in slices {
                    let angle = Angle(degrees: 360 * (slice.value / total))
                    let endAngle = startAngle + angle
                    
                    let path = Path { p in
                        p.move(to: .zero)
                        p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        p.closeSubpath()
                    }
                    
                    pieContext.fill(path, with: .color(slice.color.opacity(0.6)))
                    pieContext.stroke(path, with: .color(slice.color), lineWidth: 1)
                    startAngle = endAngle
                    
                }
            }
            .frame(width: 280)
            .background(Color(.white))
            .cornerRadius(15)
            
            Spacer()
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(slices) { slice in
                        HStack {
                            Circle()
                                .foregroundColor(slice.color)
                                .frame(width: 20, height: 20)
                            Text(slice.name)
                        }
                    }
                }
            }
        }
    }
}



