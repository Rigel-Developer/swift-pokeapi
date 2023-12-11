//
//  ImageData.swift
//  who is that pokemon
//
//  Created by jhonny mauricio la torre on 10/12/23.
//

import Foundation


struct ImageData:Codable {
    let sprites: Sprites
}

// MARK: Sprites
class Sprites:Codable {
    let other:Other?
    
    init(other:Other?){
        self.other = other
    }
}
struct Other:Codable {
    let officialArtwork : OfficialArtwork?
    enum CodingKeys:String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork:Codable {
    let frontDefault:String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}











