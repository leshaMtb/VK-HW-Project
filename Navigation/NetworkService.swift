//
//  NetworkService.swift
//  Navigation
//
//  Created by Apple on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration: String,CaseIterable {
    case people8 = "https://swapi.dev/api/people/8"
    case starship3 = "https://swapi.dev/api/starships/3"
    case planet5 = "https://swapi.dev/api/planets/5"
}

var appConfiguration: AppConfiguration? = nil

struct NetworkService {
    
    func getData() {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: appConfiguration!.rawValue) else {
            return
        }
        session.dataTask(with: url) { (data, response, error) in
            //при отсутствии подключения ловим в консоле сообщение - "The Internet connection appears to be offline."
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { print("ERROR: \(error?.localizedDescription)"); return }
            print("DATA:")
            if let data = data {
                let str = String(decoding: data, as: UTF8.self)
                print(str)
            }
            print("RESPONSE STATUS CODE:")
            print(httpResponse.statusCode)
            print("RESPONSE ALL HEADERS:")
            print(httpResponse.allHeaderFields as! [String: Any])
        }.resume()
    }
}
