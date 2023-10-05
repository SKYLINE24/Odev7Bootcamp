//
//  ViewController.swift
//  Odev7Bootcamp
//
//  Created by Erbil Can on 5.10.2023.
//
//MARK: İMPORT

import UIKit
import RxSwift

//MARK: CLASS
class Anasayfa: UIViewController {

    @IBOutlet weak var yapilacaklarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var yapilacaklarListesi = [Yapilacaklar]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        _ = viewModel.yapilacaklarListesi.subscribe(onNext: { liste in
            self.yapilacaklarListesi = liste
            self.yapilacaklarTableView.reloadData()
        })
        
    }
    override func viewWillAppear(_ animated: Bool) {
            viewModel.yapilacaklariYukle()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yapilacak = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! DetaySayfasi
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }
}
//MARK: Extensions
extension Anasayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}
                                                    
extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarCell") as! YapilacaklarCell
        
        let yapilacak = yapilacaklarListesi[indexPath.row]
        cell.labelBaslik.text = yapilacak.yapilacak_baslik
        cell.labelIcerik.text = yapilacak.yapilacak_icerik
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ contextualAction,view,bool in
            let yapilacak = self.yapilacaklarListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.yapilacak_baslik!) silinsi mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModel.sil(yapilacak_id: yapilacak.yapilacak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
