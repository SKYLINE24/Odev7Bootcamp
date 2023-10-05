//
//  YapilacaklarDaoRepo.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import Foundation
import RxSwift

class YapilacaklarDaoRepo{
    
    var yapilacaklarListesi = BehaviorSubject<[Yapilacaklar]>(value: [Yapilacaklar]())
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("liste.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(yapilacak_baslik:String,yapilacak_icerik:String){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_baslik,yapilacak_icerik) VALUES (?,?)", values: [yapilacak_baslik,yapilacak_icerik])
            print("kayitSayfasi geçti")
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func guncelle(yapilacak_id:Int,yapilacak_baslik:String,yapilacak_icerik:String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE yapilacaklar SET yapilacak_baslik=?,yapilacak_icerik=? WHERE yapilacak_id=?", values: [yapilacak_baslik,yapilacak_icerik,yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ara(aramaKelimesi:String){
        db?.open()
        
        var liste = [Yapilacaklar]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_baslik like '%\(aramaKelimesi)%'", values: nil)
            
            while rs.next() {
                let yapilacak_id  = Int(rs.string(forColumn: "yapilacak_id"))!
                let yapilacak_baslik  = rs.string(forColumn: "yapilacak_baslik")!
                let yapilacak_icerik = rs.string(forColumn: "yapilacak_icerik")!
                
                let yapilacak = Yapilacaklar(yapilacak_id: yapilacak_id, yapilacak_baslik: yapilacak_baslik, yapilacak_icerik: yapilacak_icerik)
                liste.append(yapilacak)
            }
            
            yapilacaklarListesi.onNext(liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(yapilacak_id:Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id=?", values: [yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilacaklariYukle(){
        db?.open()
        
        var liste = [Yapilacaklar]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while rs.next() {
                let yapilacak_id  = Int(rs.string(forColumn: "yapilacak_id"))!
                let yapilacak_baslik  = rs.string(forColumn: "yapilacak_baslik")!
                let yapilacak_icerik = rs.string(forColumn: "yapilacak_icerik")!
                
                let yapilacak = Yapilacaklar(yapilacak_id: yapilacak_id, yapilacak_baslik: yapilacak_baslik, yapilacak_icerik: yapilacak_icerik)
                liste.append(yapilacak)
            }
            
            yapilacaklarListesi.onNext(liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "liste", ofType: ".sqlite")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("liste.sqlite")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Mevcutta veri tabanı var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
    }
}
