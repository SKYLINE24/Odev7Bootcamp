//
//  Yapilacaklar.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import Foundation

class Yapilacaklar {
    var yapilacak_id:Int?
    var yapilacak_baslik:String?
    var yapilacak_icerik:String?
    
    init(){
        
    }
    
    init(yapilacak_id: Int? = nil, yapilacak_baslik: String? = nil, yapilacak_icerik: String? = nil) {
        self.yapilacak_id = yapilacak_id
        self.yapilacak_baslik = yapilacak_baslik
        self.yapilacak_icerik = yapilacak_icerik
    }
}
