//
// Created by Shaban on 08/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation
import Alamofire

public enum AppError: Swift.Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case internet
    case connection
    case timeout
    case authentication
    case notModified
    case server(String)
    case parsingResponse(message: String)
    case badRequest(message: String)
    case underlying(code: Int, message: String, error: Swift.Error)
    case database(message: String)
    case unknown(message: String)
    case business(error: Error?, message: String)
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "🥴 Invalid URL"
        case let .httpCode(code): return "🤬 Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "🤯 Unexpected response from the server"

        case .internet:
            return "😹 No Connection To Internet"
        case .connection:
            return "No internet connection!"
        case .timeout:
            return "😹 timedout"
        case .authentication:
            return "☠️ authentication"
        case .notModified:
            return " notModified"
        case let .server(message):
            return message
        case .badRequest(let message):
            return message
        case .underlying(_, let message, _):
            return message
        case .database(let message):
            return message
        case .unknown(let message):
            return message
        case .business(_, let message):
            return message
        case .parsingResponse(let message):
            return message
        }
    }
}

public extension Error {
    var toAppError: AppError {
        let nsError = self as NSError
        return nsError.toAppError
    }
}

public extension NSError {
    var toAppError: AppError {
        let code = URLError.Code(rawValue: code)

        switch code {
        case .notConnectedToInternet,
             .networkConnectionLost:
            return .internet
        case .timedOut:
            return .timeout
        case .cannotFindHost:
            return .connection
        case .cannotConnectToHost:
            return .server(localizedDescription)
        case .userAuthenticationRequired:
            return .authentication
        case .badServerResponse,
             .cannotParseResponse,
             .cannotDecodeRawData,
             .cannotDecodeContentData:
            return .parsingResponse(message: "\(code): \(localizedDescription)")
        case .badURL,
             .unsupportedURL:
            return .badRequest(message: "\(code): Endpoint failed to encode the parameters for the URLRequest: \(localizedDescription)")
        default:
            return .underlying(code: code.rawValue, message: "\(code): \(localizedDescription)", error: self)
        }
    }
}

public extension AFError {
    var toAppError: AppError {
        let nsError = self as NSError
        return nsError.toAppError
    }
}
