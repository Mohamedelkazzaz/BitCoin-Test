//
//  ApiManager.swift
//  Bitcoin
//
//  Created by Mohamed Elkazzaz on 14/09/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static func loadCompanies(completion: @escaping(_ error: Error?, _ currency: Bpi?) -> Void)  {
        let url = "https://api.coindesk.com/v1/bpi/currentprice.json"
        AF.request(url ,method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).response{
            response in
            
            guard let data = response.data else{
                print("Can't get any data")
                return
            }
            do{
                let decoder = JSONDecoder()
                let bitcoinPrice = try decoder.decode(Currency.self, from: data)
                
                print(bitcoinPrice)
            }catch let error{
                print(error)
                print(error)

                
            }
        }
    }
    
}

