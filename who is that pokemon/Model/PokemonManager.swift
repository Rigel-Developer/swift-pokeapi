//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by jhonny mauricio la torre on 10/12/23.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon ( pokemons: [PokemonModel])
    func didFailWithError ( error: Error)
}


struct PokemonManager {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=898"
    
    var delegate : PokemonManagerDelegate?
    
    func fetchPokemon () {
        performRequest(with: pokemonURL)
    }
    
    
    
    private func performRequest ( with urlString: String) {
        //1.- create/get URL
        if let url = URL(string: urlString){
            //2.- create URLSession
            let session = URLSession(configuration: .default)
            
            //3.- Give the session task
            let task = session.dataTask(with: url) {data,response,error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData: safeData){
                        self.delegate?.didUpdatePokemon(pokemons: pokemon)
                    }
                }
            }
            // 4.- Start the task
            task.resume()
        }
    }
    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            //MAP
//            let pokemon = decodeData.results?.map {
//                PokemonModel(name: $0.name ?? "", imageUrl: $0.url ?? "")
//            }
            
            //CONCATMAP
            let pokemon = decodeData.results?.compactMap({
                if let name = $0.name, let imageURL = $0.url{
                    return PokemonModel(name: name, imageUrl: imageURL)
                }
                return nil
            })
            return pokemon
        }catch {
            return nil
        }
    }
    
}


