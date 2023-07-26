//
//  GameScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI

struct GameScreen: View {
    var url:String?
    init(url: String) {
        self.url = url
    }
    @State private(set) var isErrorOccured = false
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var gameViewModel: GameScreenViewModel
    var body: some View {
        ZStack{
            Image("BG2").resizable().edgesIgnoringSafeArea(.all)
            VStack(spacing: 40){
                HStack{
                    Text("Trivia").font(.title).foregroundColor(Color("AccentColor")).fontWeight(.heavy)

                    Spacer()
                    Text("\(gameViewModel.timerValue)")
                        .font(.title).foregroundColor(Color("AccentColor")).fontWeight(.light)
                    Spacer()
                    Text("\(gameViewModel.index + 1) / \(gameViewModel.length)").font(.title).foregroundColor(Color("AccentColor")).fontWeight(.light)
                    
                }.navigationBarBackButtonHidden(true)
                
                ProgressBar(progress: gameViewModel.progress)
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(gameViewModel.question)
                        .padding().font(.system(size: 20)).bold().foregroundColor(Color("AccentColor"))
                    
                    ForEach(gameViewModel.answerChoices, id: \.id) { answer in
                        GameAnswer(answerModel: answer, gameViewModel: gameViewModel)
                        
                    }
                    
                }.onAppear{
                    Task{
                        await getAPIData()
                    }
                    
                }.refreshable {
                    await getAPIData()
                }
                
                if gameViewModel.answerSelected == true{
                    Button {
                       gameViewModel.coordinator = coordinator
                       gameViewModel.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background:   Color("AccentColor"))
                    }
                }else{
                    Button {
                        gameViewModel.coordinator = coordinator
                        gameViewModel.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background:  gameViewModel.answerSelected ? Color.purple : Color.gray)
                    }
                    .disabled(!gameViewModel.answerSelected)
                
                    
                }
                
                Spacer()
                
                
            }.padding().navigationBarBackButtonHidden(true)
        }
        
    }
    
    func getAPIData()async{
        guard let urlPoint = self.url else {
            print("DEBUG: did not get url")
            return}
        await gameViewModel.getGameQuestions(withUrlString: urlPoint)
        if gameViewModel.networkError != nil {
            isErrorOccured = true
        }
    }
    
    func saveQuestions(_ questions: AttributedString) {
        let attributedString = NSAttributedString(questions)
        _ = attributedString.string
        UserDefaults.standard.set(questions, forKey: "question")
    }

    func getQuestions() -> AttributedString {
        guard let questionString = UserDefaults.standard.string(forKey: "question") else {
            return AttributedString("")
        }
        
        return AttributedString(questionString)
    }
    
}

//struct GameScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        GameScreen(url: "")
//    }
//}
