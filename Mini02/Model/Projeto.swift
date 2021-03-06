//
//  Projeto.swift
//  Mini02
//
//  Created by Gabriel Sousa on 09/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Projeto{
    let ref: DatabaseReference?
    let chave: String?
    var usuario: [String:String]?
    var materiais: [Any]?
    var total: Float = 0
    var totalHora: Float?
    var custosExtras: Float?
    var lucroHora: Float?
    var horasTrabalhadas: Float?
    var nome: String?
    var categoria: String?
    let data: String?
    let formatoData = "dd/MM"
    let hora: String?
    let formatoHora = "HH"
    
    
    //init com usario
    init(usuario: [String:String], materiais: [Any], custosExtras: Float, horasTrabalhadas: Float, chave: String = "", categoria: String, nome: String){
        self.ref = nil
        self.chave = chave
        self.usuario = usuario
        self.materiais = materiais
        self.custosExtras = custosExtras
        self.horasTrabalhadas = horasTrabalhadas
        self.nome = nome
        self.categoria = categoria
        let data = DateFormatter()
        data.dateFormat = formatoData
        let dataFormatada = data.string(from: Date())
        self.data = dataFormatada
        
        let hora = DateFormatter()
        hora.dateFormat = formatoHora
        let horaFormatada = hora.string(from: Date())
        self.hora = horaFormatada
    }
    
    func setTotal(total: Float){
        
        self.total = total
        
    }
    
    //init sem usuario
    init(materiais: [Any], custosExtras: Float, horasTrabalhadas: Float, chave: String = "", categoria: String, nome: String){
        self.ref = nil
        self.chave = chave
        
        self.usuario = nil
        self.materiais = materiais
        self.custosExtras = custosExtras
        self.horasTrabalhadas = horasTrabalhadas
        self.nome = nome
        self.categoria = categoria
        let data = DateFormatter()
        data.dateFormat = formatoData
        let dataFormatada = data.string(from: Date())
        self.data = dataFormatada
        
        let hora = DateFormatter()
        hora.dateFormat = formatoHora
        let horaFormatada = hora.string(from: Date())
        self.hora = horaFormatada
        
        //calculo aqui
        
        // lucro = (total + lucroPretendido) / horasTrabalhadas
    }
    
    init?(snapshot: DataSnapshot){
    
    guard
    let valor = snapshot.value as? [String:AnyObject],
    let materiais = valor["materiais"] as? [Any],
    let usuario = valor["usuario"] as? [String:String],
    let custosExtras = valor["custosExtras"] as? Float,
    let horasTrabalhadas = valor["horasTrabalhadas"] as? Float,
    let nome = valor["nome"] as? String,
    let categoria = valor["categoria"] as? String,
    let total = valor["total"] as? Float,
    let data = valor["data"] as? String,
    let hora = valor["hora"] as? String
    else {return nil}
    
     
    self.chave = snapshot.key
    print(chave)
    self.ref = snapshot.ref
    self.materiais = materiais
    self.usuario = usuario
    self.nome = nome
    self.categoria = categoria
    self.horasTrabalhadas = horasTrabalhadas
    self.custosExtras = custosExtras
    self.total = total
    self.data = data
    self.hora = hora
        
    
    }
    
    func toAnyObject() -> Any{
        return[
            "usuario" : usuario ?? "anônimo",
            "materiais" : materiais!,
            "custosExtras" : custosExtras!,
            "horasTrabalhadas": horasTrabalhadas!,
            "total": total,
            "nome": nome!,
            "categoria": categoria!,
            "data": data!,
            "hora": hora!,
            "chave": chave ?? "nil",
           
        ]
    }
    
    func setNome(nome: String){
        self.nome = nome
    }
    
    func setCategoria(categoria: String){
        self.categoria = categoria
    }
    
    
    
}
