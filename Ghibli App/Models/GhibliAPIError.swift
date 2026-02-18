//
//  GhibliAPIError.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//



enum GhibliAPIError: Error {
    case invalidURL
    case noData
    case invalidData
    case unkownError
    case invalidResponse
    case invalidStatusCode
    case jsonParsingFailure
}


