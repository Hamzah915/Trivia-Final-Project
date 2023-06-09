//
//  NetworkableError.swift
//  Trivia
//
//  Created by Hamzah Azam on 26/05/2023.
//

import Foundation
enum NetworkError :String{
    case dataNotFoundError
    case parsingError
    case invalidUrlError
    case dataTimeout
}

extension NetworkError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotFoundError:return NSLocalizedString("API Failed to give data", comment: NetworkError.dataNotFoundError.rawValue)
        case .parsingError: return NSLocalizedString("Failed to parse API", comment: NetworkError.parsingError.rawValue)
        case .invalidUrlError: return NSLocalizedString("Invalid URL", comment: NetworkError.invalidUrlError.rawValue)
        case .dataTimeout: return NSLocalizedString("Data Timed Out", comment:
            NetworkError.dataTimeout.rawValue)
        }
    }
}
