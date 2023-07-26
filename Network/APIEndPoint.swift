//
//  APIEndPoint.swift
//  Trivia
//
//  Created by Hamzah Azam on 19/05/2023.
//

import Foundation
  struct APIEndPoint{
//    static var endPointUrl = "https://opentdb.com/api.php?amount=\(amountNumber)&category=\(categoryNumber)&difficulty=\(difficulty)&type=multiple"
//    static var categoryNumber = 9
//    static var amountNumber = 20
//    static var difficulty = "easy"
      
      
      
}



enum Category : Int, CaseIterable, Hashable{
    case generalKnowledge = 9
    case entertainmentBooks
    case entertainmentFilm
    case entertainmentMusic
    case entertainmentMusicalsAndTheatres
    case entertainmentTelevison
    case entertainmenVideoGames
    case entertainmentBoardGames
    case scienceAndNature
    case scienceComputers
    case scienceMathematics
    case mythology
    case sports
    case geography
    case history
    case politics
    case art
    case celebrities
    case animals
    case vehicles
    case entertainmentComics
    case scienceGadgets
    case entertainmentJapaneseAnimeAndManga
    case entertainmentCartoonAndAnimations




    var description: String {
        switch self {
        case .generalKnowledge:
            return "General Knowledge"
        case .entertainmentBooks:
            return "Entertainment: Books"
        case .entertainmentFilm:
            return "Entertainment: Film"
        case .entertainmentMusic:
            return "Entertainment: Music"
        case .entertainmentMusicalsAndTheatres:
            return "Entertainment: Musicals & Theatres"
        case .entertainmentTelevison:
            return "Entertainment: Television"
        case .entertainmenVideoGames:
            return "Entertainment: Video Games"
        case .entertainmentBoardGames:
            return "Entertainment: Board Games"
        case .scienceAndNature:
            return "Science & Nature"
        case .scienceComputers:
            return "Science: Computers"
        case .scienceMathematics:
            return "Science: Mathematics"
        case .mythology:
            return "Mythology"
        case .sports:
            return "Sports"
        case .geography:
            return "Geography"
        case .history:
            return "History"
        case .politics:
            return "Politics"
        case .art:
            return "Art"
        case .celebrities:
            return "Celebrities"
        case .animals:
            return "Animals"
        case .vehicles:
            return "Vehicles"
        case .entertainmentComics:
            return "Entertainment: Comics"
        case .scienceGadgets:
            return "Science: Gadgets"
        case .entertainmentJapaneseAnimeAndManga:
            return "Entertainment: Japanese Anime & Manga"
        case .entertainmentCartoonAndAnimations:
            return "Entertainment: Cartoon & Animations"
        }
    }
}

enum Difficulty : String, CaseIterable, Hashable{
    case easy
    case medium
    case hard
    
    var description: String{
        switch self{
        case .easy:
            return "easy"
        case .medium:
            return "medium"
        case .hard:
            return "hard"
        }
    }
}





