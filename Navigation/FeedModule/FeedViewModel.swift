//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Apple on 07.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


protocol FeedViewOutput {
    func check(word: String)
    var color: UIColor? { get set }
}


class FeedViewModel: FeedViewOutput {

    var publisher: Publisher?

    var color: UIColor? = nil

    func check(word: String) {
        publisher?.checkWord(word: word)

        NotificationCenter.default.addObserver(self, selector: #selector(trueSelector), name: NSNotification.Name(rawValue: "true") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(falseSelector), name: NSNotification.Name(rawValue: "false") , object: nil)
    }

    @objc func trueSelector() {
        color = .green
    }
    @objc func falseSelector() {
        color = .red
    }
}
