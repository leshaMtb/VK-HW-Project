//
//  Users.swift
//  Navigation
//
//  Created by Apple on 09.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol UserService {
    func userName(name: String) -> User
}


final class User {
    var name: String
    var avatar: UIImage?
    var status: String

    init(name: String, avatar: UIImage?, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}


class CurrentUserService: UserService {
    let userAleksey = User(name: "Aleksey Shirokov✌️" , avatar: #imageLiteral(resourceName: " Аватарочка-1"), status: "Это релиз сборка")
    func userName(name: String) -> User {
        if name == "Aleksey" {
            return userAleksey
        } else {
            return User(name: "Собака Собака", avatar: #imageLiteral(resourceName: "dog"), status: "я милый пес")
        }
    }
}


class TestUserService: UserService {
    let testUser = User(name: "Тест Тест", avatar: #imageLiteral(resourceName: "bar"), status: "Это дебаг сборка")
    func userName(name: String) -> User {
        return testUser
    }
}
