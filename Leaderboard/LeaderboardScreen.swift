//
//  LeaderboardScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 31/05/2023.
//

import SwiftUI

struct LeaderboardScreen: View {
    @EnvironmentObject var gameViewModel: GameScreenViewModel
    var optionsScreen: OptionsScreen


    var body: some View {
        ZStack{
            Image("BackgroundImage2").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 10)
                Group{
                    Text("Last Game:").font(.title)
                    Spacer()

                    Text("Category - \(optionsScreen.getCatName()), Difficulty - \(optionsScreen.getDifficulty())")
                    
                    Text("Score: \(gameViewModel.getScore()) out of \(gameViewModel.getQuestionNumber())")
                    
//                    Text("Questions: \(gameViewModel.)")
                    
                }.fontWeight(.heavy).foregroundColor(.white).padding()
            }
        }
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen(optionsScreen: OptionsScreen()).environmentObject(GameScreenViewModel(manager: NetworkManager()))
    }
}


