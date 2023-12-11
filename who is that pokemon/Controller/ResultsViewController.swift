//
//  ResultsViewController.swift
//  who is that pokemon
//
//  Created by jhonny mauricio la torre on 11/12/23.
//

import UIKit
import Kingfisher
class ResultsViewController: UIViewController {

    @IBOutlet weak var imageResponse: UIImageView!
    
    @IBOutlet weak var labelMsgNamePokemon: UILabel!
    
    @IBOutlet weak var labelScoreFinal: UILabel!
    
    
    var pokemonName: String = ""
    var pokemonImageUrl:String = ""
    var finalScore:Int = 0
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        labelScoreFinal.text = "Perdiste, tu puntaje fue de \(finalScore)"
        labelMsgNamePokemon.text = "No, es un \(pokemonName)"
        imageResponse.kf.setImage(with: URL(string: pokemonImageUrl))

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
}
