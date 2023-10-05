//
//  KayitSayfasiViewModel.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import Foundation

class KayitSayfasiViewModel{
    var yrepo = YapilacaklarDaoRepo()
    
    func kaydet(yapilacak_baslik:String,yapilacak_icerik:String){
        yrepo.kaydet(yapilacak_baslik: yapilacak_baslik, yapilacak_icerik: yapilacak_icerik)
        print("kayitSayfasi view geçti")
    }
}
