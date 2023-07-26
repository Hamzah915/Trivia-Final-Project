//
//  GameAnswer.swift
//  Trivia
//
//  Created by Hamzah Azam on 24/05/2023.
//

import SwiftUI

struct GameAnswer: View {
    var answerModel: AnswerModel
    @ObservedObject var gameViewModel: GameScreenViewModel
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill").font(.caption)
            
            Text(answerModel.answer).bold()
            
            
            if gameViewModel.answerSelected && isSelected && answerModel.isCorrect{
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(green)
            } else if gameViewModel.answerSelected && isSelected && !answerModel.isCorrect {
                Spacer()
                Image(systemName: "x.circle.fill")
                    .foregroundColor(red)
            } else if gameViewModel.answerSelected && !isSelected && answerModel.isCorrect{
                Spacer()
                Image(systemName: "checkmark.circle.fill").foregroundColor(green)
            }
            
        }.navigationBarBackButtonHidden(true)
        
            .padding().frame(maxWidth: .infinity, alignment: .leading)
        
            .foregroundColor(gameViewModel.answerSelected ? (isSelected ? Color("AccentColor") : (answerModel.isCorrect ? green : .gray) ) : Color("AccentColor"))
        
            .background(.white).cornerRadius(10)
        
            .shadow(color: gameViewModel.answerSelected ? (isSelected && !answerModel.isCorrect ? red : (answerModel.isCorrect ? green : .gray)) : .gray, radius: 5, x: 0.5, y: 0.5).opacity(0.7)
        
        
        
        
        
        
        
            .onTapGesture {
                if gameViewModel.answerSelected == false{
                    isSelected = true
                    gameViewModel.answerSelected = true
                    gameViewModel.selectAnswer(answer: answerModel)
                }else{
                    print(1234)
                }
                
            }
    }
}

struct GameAnswer_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswer(answerModel: AnswerModel(answer: "answer", isCorrect: true), gameViewModel: GameScreenViewModel(manager: NetworkManager()))
    }
}
