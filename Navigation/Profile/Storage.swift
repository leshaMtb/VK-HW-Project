//
//  Storage.swift
//  Navigation
//
//  Created by Apple on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

let author = "Shirokov Aleksey"

struct PostNew {
    let author: String
    let description: String
    let image: UIImage
    let likes: String
    let viewsCount: String
}


struct Storage {
    static let arrayOfPosts = [
        PostNew(author: author, description: "My first car - bmw e90", image: #imageLiteral(resourceName: "car1"), likes: "Likes: 10", viewsCount: "Views: 112"),
        PostNew(author: author, description: "Напишу здесь немного рандомного текста из головы чтобы проверить как растягивается ячейка с большим описанием. Когда я был совсем маленьким,дедуля отвел меня в цирк,там было мнооого всего интереесного и бла бла бла, но сильнее всего мне запомнился полет радиоуправляемого самолета в антракте. Спустя 15 лет я обзавелся собственным кружком по авиамоделированию :)", image: #imageLiteral(resourceName: "plane"), likes: "Likes: 29", viewsCount: "Views: 150"),
        PostNew(author: author, description: "Делаю барспин под строгинским мостом!", image: #imageLiteral(resourceName: "barspin"), likes: "Likes: 20", viewsCount: "Views: 148"),
        PostNew(author: author, description: "Мама говорит,что я красивый", image: #imageLiteral(resourceName: "skatePark"), likes: "Likes: 12", viewsCount: "Views: 67")
    ]
}




