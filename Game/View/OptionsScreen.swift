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
    @State private var selectedCategory: String?
    var body: some View {
        VStack{
            Text("Selected Category: \(selectedCategory ?? "")")
                           .font(.headline)

                       Picker("Select Category", selection: $selectedCategory) {
                           ForEach(gameViewModel.gameScreenList , id: \.category) { category in
                               Text(verbatim: ("\(category)"))
                           }
                       }.pickerStyle(MenuPickerStyle())
            Button {
                coordinator.goToGameScreen()
            } label: {
                PrimaryButton(text: "Go to Game")
            }
            
        }
        
       

                   .onAppear {
                       gameViewModel.gameScreenList
        }.navigationBarBackButtonHidden(true)
        
        
    }
}

struct OptionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionsScreen()
    }
}
