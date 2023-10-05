//
//  KayitSayfasi.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//

import UIKit

class KayitSayfasi: UIViewController {
    @IBOutlet weak var tfBaslik: UITextField!
    @IBOutlet weak var tfIcerik: UITextField!
    
    var viewModel = KayitSayfasiViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let baslik = tfBaslik.text, let icerik = tfIcerik.text{
            viewModel.kaydet(yapilacak_baslik: baslik, yapilacak_icerik: icerik)
            print("kayitSayfasi geçti")
        }
    }
}
