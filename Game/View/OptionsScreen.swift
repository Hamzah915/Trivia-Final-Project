//
//  OptionsScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 31/05/2023.
//

import SwiftUI

struct OptionsScreen: View {
    @EnvironmentObject var gameViewModel: GameScreenViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private (set) var isErrorOccurred = false
    @State var selectedCategory: Int = 9//Use the same type as the enum
    @State var selectDifficulty: String = "easy"
    @State var selectAmountNumber: Int = 10

    
    let nums = 0..<50
    var stringNums :[String] = []
    init(){
        stringNums = nums.map { num in
            "\(num)"
        }
    }
    
    var body: some View {
        ZStack{
            Image("BG2").resizable().edgesIgnoringSafeArea(.all)
            VStack {
                Text("Select Category: ")
                    .font(.headline).fontWeight(.heavy).foregroundColor(Color("AccentColor"))

                Picker(selection: $selectedCategory) {
                    ForEach(Category.allCases, id: \.self) {catItem in
                        Text(catItem.description)
                            .tag(catItem.rawValue)
                    }
                } label: {
                    Text("Some picker")
                }.pickerStyle(.menu).onChange(of: selectedCategory) { _ in
                    saveCategory(selectedCategory)
                }

                
                
                Text("Select Difficulty: ")
                    .font(.headline).fontWeight(.heavy).foregroundColor(Color("AccentColor"))

                Picker(selection: $selectDifficulty) {
                    ForEach(Difficulty.allCases, id: \.self) {diffItem in
                        Text(diffItem.description)
                            .tag(diffItem.rawValue)
                    }
                } label: {
                    Text("Some picker")
                }.pickerStyle(.menu).onChange(of: selectDifficulty) { _ in
                    saveDifficulty(selectDifficulty)
                }
                    
                
                
                
                Text("Select Number Of Questions: ")
                    .font(.headline).fontWeight(.heavy).foregroundColor(Color("AccentColor"))

                Picker(selection: $selectAmountNumber) {
                    ForEach(1..<51,id: \.self) {num in
                        Text("\(num)")
                            .tag(num)
                    }
                } label: {
                    Text("Some picker")
                }.pickerStyle(.menu)
                
                
                
                
                Button {
//                    APIEndPoint.categoryNumber = selectedCategory
//                    APIEndPoint.difficulty = selectDifficulty
                    
                    let endPointUrl = "https://opentdb.com/api.php?amount=\(selectAmountNumber)&category=\(selectedCategory)&difficulty=\(selectDifficulty)&type=multiple"
                    
                    
                    coordinator.goToGameScreen(url: endPointUrl)
                } label: {
                    PrimaryButton(text: "Go to Game")
                }
            }.padding()
            
        }
    }
    
    
    func saveCategory(_ category: Int) {
            UserDefaults.standard.set(category, forKey: "category")
        }

    func getCategory() -> Int {
        return UserDefaults.standard.integer(forKey: "category")
    }
    
    func saveDifficulty(_ difficulty: String) {
            UserDefaults.standard.set(difficulty, forKey: "difficulty")
        }

    func getDifficulty() -> String {
        return UserDefaults.standard.string(forKey: "difficulty")!
    }
    
    func getCatName() -> String{
        let catNum = getCategory()
        let catName = Category(rawValue: catNum)?.description
        return catName ?? "no name"
    }

}

struct OptionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionsScreen()
    }
}
