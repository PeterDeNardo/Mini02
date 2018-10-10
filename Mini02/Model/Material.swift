//
//  Mini02
//
//  Created by Gabriel Sousa on 09/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Material{
    let ref: DatabaseReference?
    let chave: String?
    var nome: String?
    var tipo: String?
    var preco: Float?
    var marca: String?
    
    init(nome: String, tipo: String, preco: Float, marca: String, chave: String = ""){
        ref = nil
        self.nome = nome
        self.tipo = tipo
        self.preco = preco
        self.marca = marca
        self.chave = chave
    }
    
    init?(snapshot: DataSnapshot){
        
        guard
            let valor = snapshot.value as? [String:AnyObject],
            let nome = valor["nome"] as? String,
            let preco = valor["preco"] as? Float,
            let tipo = valor["tipo"] as? String,
            let marca = valor["marca"] as? String
            
            else {return nil}
        
        self.chave = snapshot.key
        self.ref = snapshot.ref
        
        self.preco = preco
        self.tipo = tipo
        self.nome = nome
        self.marca = marca
        
        
    }
    
    func toAnyObject() -> Any{
        return[
            "preco" : preco!,
            "tipo" : tipo!,
            "marca" : marca!,
            "nome": nome!,
        ]
    }

    
    
    
}