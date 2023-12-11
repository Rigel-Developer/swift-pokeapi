//
//  PokemonData.swift
//  who is that pokemon
//
//  Created by jhonny mauricio la torre on 10/12/23.
//


import Foundation

// MARK: - PokemonData
struct PokemonData: Codable {
    
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
}


