//
//  EndGame.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//

import SwiftUI

struct EndGame: View {
    @EnvironmentObject var gameViewModel: GameScreenViewModel
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
//        if gameViewModel.reachedEnd == true {
            VStack(spacing: 20) {
                Text("Congratulations, you completed the game!🥳")
                
                Text("You scored \(gameViewModel.score) out of \(gameViewModel.length)")
                Group{
                    Button {
                        coordinator.goToGameScreen()
                    } label: {
                        PrimaryButton(text: "Play again")
                    }
                    
                    Button {
                        coordinator.goToHomeScreen()
                    } label: {
                        PrimaryButton(text: "go back home")
                    }
                    
                }
            }.foregroundColor(Color("AccentColor")).padding().frame(maxWidth: .infinity,maxHeight: .infinity).font(.title).fontWeight(.heavy)
                .background(Color.blue.opacity(0.3))
                .navigationBarBackButtonHidden(true)
//        }else{
//            HomeScreen()
//        }
        
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame().environmentObject(GameScreenViewModel(manager: NetworkManager()))
    }
}
