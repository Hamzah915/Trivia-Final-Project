//
//  MainScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath){
            coordinator.goToScreen(screen: .HomeScreen)
            .navigationDestination(for: MyScreen.self) { navigation in
                coordinator.goToScreen(screen: navigation)
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(Coordinator())
    }
}
