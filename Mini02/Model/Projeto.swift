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
    var total: Float?
    var totalHora: Float?
    var lucroPretendido: Float?
    var lucroHora: Float?
    var horasTrabalhadas: Float?
    var nome: String?
    var categoria: String?
    
    //init com usario
    init(usuario: [String:String], materiais: [Any], lucroPretendido: Float, horasTrabalhadas: Float, chave: String = "", categoria: String, nome: String){
        self.ref = nil
        self.chave = chave
        
        self.usuario = usuario
        self.materiais = materiais
        self.lucroPretendido = lucroPretendido
        self.horasTrabalhadas = horasTrabalhadas
        self.nome = nome
        self.categoria = categoria
        
        //calculo aqui
    }
    
    //init sem usuario
    init(materiais: [Any], lucroPretendido: Float, horasTrabalhadas: Float, chave: String = "", categoria: String, nome: String){
        self.ref = nil
        self.chave = chave
        
        self.usuario = nil
        self.materiais = materiais
        self.lucroPretendido = lucroPretendido
        self.horasTrabalhadas = horasTrabalhadas
        self.nome = nome
        self.categoria = categoria
        
        //calculo aqui
        
        // lucro = (total + lucroPretendido) / horasTrabalhadas
    }
    
    init?(snapshot: DataSnapshot){
    
    guard
    let valor = snapshot.value as? [String:AnyObject],
    let materiais = valor["materiais"] as? [Any],
    let usuario = valor["usuario"] as? [String:String],
    let lucroPretendido = valor["lucroPretendido"] as? Float,
    let horasTrabalhadas = valor["lucroPretendido"] as? Float,
    let nome = valor["nome"] as? String,
    let categoria = valor["categoria"] as? String
        
    else {return nil}
    
    self.chave = snapshot.key
    self.ref = snapshot.ref
    
    self.materiais = materiais
    self.usuario = usuario
    self.nome = nome
    self.categoria = categoria
    self.horasTrabalhadas = horasTrabalhadas
    self.lucroPretendido = lucroPretendido
    
    }
    
    func toAnyObject() -> Any{
        return[
            "usuario" : usuario ?? "anônimo",
            "materiais" : materiais!,
            "lucroPretendido" : lucroPretendido!,
            "horasTrabalhadas": horasTrabalhadas!,
            "nome": nome!,
            "categoria": categoria!
        ]
    }
    
    func setNome(nome: String){
        self.nome = nome
    }
    
    func setCategoria(categoria: String){
        self.categoria = nome
    }
    
    
    
}
