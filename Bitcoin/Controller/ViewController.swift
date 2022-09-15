//
//  ViewController.swift
//  Bitcoin
//
//  Created by Mohamed Elkazzaz on 14/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdPriceLabel: UILabel!
    @IBOutlet weak var eurPriceLabel: UILabel!
    @IBOutlet weak var gprPriceLabel: UILabel!
    
    var currency : Bpi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        ApiManager.loadCompanies()
        callApi()
        usdPriceLabel.text = "\(currency?.usd.rateFloat ?? 0.0)"
        eurPriceLabel.text = "\(currency?.eur.rateFloat ?? 0.0)"
        gprPriceLabel.text = "\(currency?.gbp.rateFloat ?? 0.0)"
        
    }
    
    
    private func callApi(){
        ApiManager.loadCompanies { error, bbi in
            if error != nil {
                self.currency = bbi
                print(bbi ?? "")
            }
        }
    }


}

