//
//  model.swift
//  StorageService
//
//  Created by Apple on 30.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
//типо слой бизнес логики)
public class Publisher {

    let notificationCenter = NotificationCenter.default
    let name = "слово"

    public init() {}

    public func checkWord(word: String) {
        if word == name {
            let notification = Notification(name:  NSNotification.Name(rawValue: "true"), object: nil, userInfo: nil)
            notificationCenter.post(notification)
        } else {
            let notification = Notification(name:  NSNotification.Name(rawValue: "false"), object: nil, userInfo: nil)
            notificationCenter.post(notification)
        }
    }
}

