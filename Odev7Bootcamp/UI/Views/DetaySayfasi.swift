//
//  DetaySayfasi.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import UIKit

class DetaySayfasi: UIViewController {

    @IBOutlet weak var tfBaslik: UITextField!
    @IBOutlet weak var tfYapilacak: UITextField!
    
    var yapilacak:Yapilacaklar?
    
    var viewModel = DetaySayfasiViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacak{
            tfBaslik.text = y.yapilacak_baslik
            tfYapilacak.text = y.yapilacak_icerik
        }
    }
    
    @IBAction func buttonGuncelleme(_ sender: Any) {
        if let baslik = tfBaslik.text, let icerik = tfYapilacak.text, let y = yapilacak{
            viewModel.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_baslik: baslik, yapilacak_icerik: icerik)
        }
    }
}
