//
//  GreenViewModel.swift
//  Navigation
//
//  Created by Apple on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol GreenViewOutout {
    var callFromViewToModel: () -> Void { get set }

    func getLabelTextJSONSerialization (complition:  @escaping(String) -> Void)

    func getLabelTextJSONDecoder (complition:  @escaping(String) -> Void)
}


class GreenViewModel: GreenViewOutout {

    var toRoot: (() -> Void)?
   
    func getLabelTextJSONSerialization(complition: @escaping(String) -> Void) {

        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) {
            (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! Array<Any>
                let dictionary = json as! [Dictionary<String, Any>]
                print(dictionary[2]["title"]!)
                complition(dictionary[2]["title"]! as! String)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }


    func getLabelTextJSONDecoder(complition: @escaping(String) -> Void) {

        struct WelcomeElement: Codable {
        var userId: Int
        var id: Int
        let title: String
        let completed: Bool
        }

        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) {(data, response, error) in
        guard let data = data else { return }
        do {
        let json = try JSONDecoder().decode([WelcomeElement].self, from: data)
        complition(json[2].title)
        } catch {
        print(error.localizedDescription)
        }
        }.resume()
    }


    lazy var callFromViewToModel: () -> Void = { [weak self] in
        self?.toRoot?()
    }


}
