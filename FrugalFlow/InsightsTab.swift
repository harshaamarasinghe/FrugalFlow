import SwiftUI
import Combine

struct InsightsTab: View {
    @StateObject private var viewModel = InsightsViewModel()
    
    @AppStorage("expense_food") var food = 0.00
    @AppStorage("expense_healthcare") var healthcare = 0.00
    @AppStorage("expense_transportation") var transportation = 0.00
    @AppStorage("expense_shopping") var shopping = 0.00
    @AppStorage("expense_payments") var payments = 0.00
    @AppStorage("expense_saving") var saving = 0.00
    
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("expence_key") var expenseStore = 0.00
    
    var foodAdvice = ""
    var healthAdvice = ""
    var transportAdvice = ""
    var shoppingAdvice = ""
    var paymentAdvice = ""
    var savingAdvice = ""
    
    var foodP = "You're demonstrating excellent budgeting skills with your food expenses!"
    var foodN = "It might be worth reviewing your food expenses to ensure they align better with your income."
    
    var healthP = "You're doing well in managing your health expenses responsibly."
    var healthN = "It appears that your health expenses might be exceeding your budget. Consider reviewing and adjusting your spending."
    
    var transP = "Your balanced approach to transportation expenses is helping you maintain a healthy financial outlook."
    var transN = "Your transportation expenses might be straining your budget. It could be helpful to explore more cost-effective options."
    
    var shopP = "Your mindful shopping choices are keeping your expenses in check and supporting your financial goals."
    var shopN = "It seems your shopping expenses might be impacting your budget. Taking a closer look at your spending could be beneficial."
    
    var payP = "Your responsible management of payment expenses reflects your commitment to financial stability."
    var payN = "Your payment expenses might be affecting your financial balance. Reviewing your payment priorities could help align your budget."
    
    var saveP = "Your consistent savings efforts demonstrate a strong commitment to building a secure financial future."
    var saveN = "It appears that your savings might be lower than desired. Exploring ways to boost your savings could lead to better financial preparedness."
    
    
    var body: some View {
        
        
        ZStack {
            Color(red: 250/255, green: 250/255, blue: 250/255)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Insights")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .padding(.top)
                    
                    VStack {
                        ForEach(viewModel.predictionsList, id: \.categoryID) { prediction in
                            // FOOD
                            if(prediction.categoryID == 0){
                                HStack(spacing:12){
                                    Image("food").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Food")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(foodN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(foodP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                            else if(prediction.categoryID == 1){
                                HStack(spacing:12){
                                    Image("health").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Health")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(healthN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(healthP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                            else if(prediction.categoryID == 2){
                                HStack(spacing:12){
                                    Image("transport").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Transportation")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(transN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(transP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                            else if(prediction.categoryID == 3){
                                HStack(spacing:12){
                                    Image("shopping").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Shopping")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(shopN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(shopP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                            else if(prediction.categoryID == 4){
                                HStack(spacing:12){
                                    Image("payment").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Payment")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(payN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(payP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                            else if(prediction.categoryID == 5){
                                HStack(spacing:12){
                                    Image("savings").resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Savings")
                                            .fontWeight(.semibold)
                                        if(prediction.prediction == "negative")
                                        {
                                            Text(saveN)
                                                .minimumScaleFactor(0.5)
                                            
                                        }
                                        else{
                                            Text(saveP)
                                                .minimumScaleFactor(0.5)
                                        }
                                        
                                    }
                                    
                                }.frame(width: 350)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .onAppear {
            viewModel.calculate()
        }
    }
}

class InsightsViewModel: ObservableObject {
    @AppStorage("expense_food") var food = 0.00
    @AppStorage("expense_healthcare") var healthcare = 0.00
    @AppStorage("expense_transportation") var transportation = 0.00
    @AppStorage("expense_shopping") var shopping = 0.00
    @AppStorage("expense_payments") var payments = 0.00
    @AppStorage("expense_saving") var saving = 0.00
    
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("expence_key") var expenseStore = 0.00
    
    @Published var predictionsList: [Prediction] = []
    
    func dayOfMonth() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date())
        return components.day ?? 0
    }
    
    func calculate(){
        
        let day = dayOfMonth()
        let dayD = Double(day)
        
        let idealPropFood = 0.3
        let idealPropHealth = 0.1
        let idealPropTrans = 0.15
        let idealPropShop = 0.1
        let idealPropPay = 0.2
        let idealPropSave = 0.15
        
        let spendable = ((salaryStore - taxStore)/30)*dayD
        
        let realPropFood = food/spendable
        let realPropHealth = healthcare/spendable
        let realPropTrans = transportation/spendable
        let realPropShop = shopping/spendable
        let realPropPay = payments/spendable
        let realPropSave = saving/spendable
        
        let dataArray: [[Double]] = [
            [0,idealPropFood,realPropFood],
            [1,idealPropHealth,realPropHealth],
            [2,idealPropTrans,realPropTrans],
            [3,idealPropShop,realPropShop],
            [4,idealPropPay,realPropPay],
            [5,idealPropSave,realPropSave],
        ]
        
        print("Sending data\(dataArray)")
        sendPostRequest(paraData: dataArray)
        
    }
    func sendPostRequest(paraData: [[Any]]) {
        
        
        guard let url = URL(string: "https://frugal-flow-model.onrender.com/get-prediction") else {
            print("Invalid URL")
            return
        }
        
        let expenses: [[Any]] = paraData
        
        let body: [String: Any] = ["expences": expenses]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        
                        var predictionsTemp : [Prediction] = []
                        
                        if let jsonData = responseString.data(using: .utf8) {
                            do {
                                // Decode the JSON data
                                let response = try JSONDecoder().decode(Response.self, from: jsonData)
                                
                                // Access the "result" array
                                let predictions = response.result
                                
                                // Print the predictions
                                for predictionRes in predictions {
                                    
                                    print("Category ID: \(predictionRes.categoryID), Prediction: \(predictionRes.prediction)")
                                    
                                    predictionsTemp.append(Prediction(
                                        categoryID: predictionRes.categoryID, prediction: predictionRes.prediction
                                    ))
                                    
                                    
                                    DispatchQueue.main.async {
                                        self.predictionsList = predictionsTemp
                                    }
                                }
                                
                                print(predictionsTemp)
                                
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        }
                    }
                }
            }
            task.resume()
        } catch {
            print("JSON serialization error: \(error)")
        }
    }
}




struct Prediction: Codable {
    let categoryID: Int
    let prediction: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category-id"
        case prediction
    }
}

struct Response: Codable {
    let result: [Prediction]
}

let dataArray: [[Any]] = [
    [0, 0.3, 0.4], [1, 0.1, 0.1], [2, 0.15, 0.15], [3, 0.1, 0.1], [4, 0.2, 0.2], [5, 0.15, 0.15]
    // ... (other data)
]

struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            InsightsTab()
        }
    }
}
