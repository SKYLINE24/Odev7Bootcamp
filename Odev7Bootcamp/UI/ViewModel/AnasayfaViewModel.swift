//
//  AnasayfaViewModel.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    var yrepo = YapilacaklarDaoRepo()
    var yapilacaklarListesi = BehaviorSubject<[Yapilacaklar]>(value: [Yapilacaklar]())
    
    init(){
        yrepo.veritabaniKopyala()
        yapilacaklarListesi = yrepo.yapilacaklarListesi
    }
    
    func ara(aramaKelimesi:String){
        yrepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacak_id:Int){
        yrepo.sil(yapilacak_id:yapilacak_id)
        yapilacaklariYukle()
    }
    
    func yapilacaklariYukle(){
        yrepo.yapilacaklariYukle()
    }
}
