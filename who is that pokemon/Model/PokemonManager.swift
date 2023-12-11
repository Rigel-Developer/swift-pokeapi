//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by jhonny mauricio la torre on 10/12/23.
//

import Foundation

struct PokemonManager {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=898"
    func performRequest ( with urlString: String) {
        //1.- create/get URL
        if let url = URL(string: urlString){
            //2.- create URLSession
            let session = URLSession(configuration: .default)
            
            //3.- Give the session task
            let task = session.dataTask(with: url) {data,response,error in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData: safeData){
                        print(pokemon)
                    }
                }
            }
            // 4.- Start the task
            task.resume()
        }
    }
    func parseJSON(pokemonData: Data) -> [PokemonModel]? {
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


