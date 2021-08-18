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

    func getLabelText (complition:  @escaping(String) -> Void)
}


class GreenViewModel: GreenViewOutout {
   
    func getLabelText(complition: @escaping(String) -> Void) {

        let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) {
            (data, response, error) in
            guard let data = data else { return }
          //  print(String(data: data, encoding: .utf8)!)
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


    var toRoot: (() -> Void)?

    lazy var callFromViewToModel: () -> Void = { [weak self] in
        self?.toRoot?()
    }


}
