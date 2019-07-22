//
//  Casella.swift
//  TrisApp
//
//  Created by Federico Barbieri on 21/05/18.
//  Copyright © 2018 Federico Barbieri. All rights reserved.
//

import UIKit

class Casella: UIView {
    
    enum stato: Int {
        
        case undefine = 0
        case x = 1
        case o = 2
    }
    
    var stato : stato = .undefine

    @IBOutlet weak var casellaIV: UIImageView!
    
    func getStato() -> stato {
        
        return self.stato
    }
    
    func setStato(stato : stato){
        
        self.stato = stato
        self.aggiornaImmagine()
    }
    
    func aggiornaImmagine(){
        
        switch self.stato {
        case .undefine:
            self.casellaIV.image = nil
        case .o:
            self.casellaIV.image = #imageLiteral(resourceName: "o")
            
            //self.casellaIV.image = UIImage(named: "o")
            
        case .x:
            self.casellaIV.image = #imageLiteral(resourceName: "x")
        }
    }
    
    func prepareCasella(){
        
        self.stato = .undefine
        self.aggiornaImmagine()
    }

}
