//
//  DetaySayfasiViewModel.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import Foundation

class DetaySayfasiViewModel{
    var yrepo = YapilacaklarDaoRepo()
    
    func guncelle(yapilacak_id:Int,yapilacak_baslik:String,yapilacak_icerik:String){
        yrepo.guncelle(yapilacak_id: yapilacak_id, yapilacak_baslik: yapilacak_baslik, yapilacak_icerik: yapilacak_icerik)
    }
}
