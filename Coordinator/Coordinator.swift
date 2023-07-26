//
//  Coordinator.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject{
    @Published var navigationPath = NavigationPath()
    
    func goToHomeScreen(){
        navigationPath.append(MyScreen.HomeScreen)
    }
    
    func goToOptionsScreen(){
        navigationPath.append(MyScreen.OptionsScreen)
    }
    
    var url : String?
    
    func goToGameScreen(url:String){
        self.url = url
        navigationPath.append(MyScreen.GameScreen)
    }
    
    func goToUIKitScreen(){
        navigationPath.append(MyScreen.UIKitScreen)
    }
    
    func goToEndGameScreen(){
        navigationPath.append(MyScreen.EndGameScreen)
    }
    
    func goToLeaderboardScreen(){
        navigationPath.append(MyScreen.LeaderboardScreen)
    }

    
    @ViewBuilder
    func goToScreen(screen: MyScreen) -> some View{
        switch screen{
        case .HomeScreen:
            HomeScreen()
        case .OptionsScreen:
            OptionsScreen()
        case .GameScreen:
            GameScreen(url: url ?? "")
        case .UIKitScreen:
            UIKitNavView()
        case .EndGameScreen:
            EndGame()
        case .LeaderboardScreen:
            LeaderboardScreen(optionsScreen: OptionsScreen())
        }
    }
}

enum MyScreen{
    case HomeScreen
    case OptionsScreen
    case GameScreen
    case UIKitScreen
    case EndGameScreen
    case LeaderboardScreen
}
