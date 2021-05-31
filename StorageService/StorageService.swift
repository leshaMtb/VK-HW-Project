//
//  StorageService.swift
//  StorageService
//
//  Created by Apple on 24.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

let author = "Shirokov Aleksey"

public class Storage {

    public static let arrayOfPosts = [
        PostNew(author: author, description: "Напишу здесь немного рандомного текста из головы чтобы проверить как растягивается ячейка с большим описанием. Когда я был совсем маленьким,дедуля отвел меня в цирк,там было мнооого всего интереесного и бла бла бла, но сильнее всего мне запомнился полет радиоуправляемого самолета в антракте. Спустя 15 лет я обзавелся собственным кружком по авиамоделированию :)", image: #imageLiteral(resourceName: "plane"), likes: "Likes: 29", viewsCount: "Views: 150"),
        PostNew(author: author, description: "Делаю барспин под строгинским мостом!", image: #imageLiteral(resourceName: "bar"), likes: "Likes: 20", viewsCount: "Views: 148"),
        PostNew(author: author, description: "My first car - bmw e90", image: #imageLiteral(resourceName: "car1"), likes: "Likes: 10", viewsCount: "Views: 112"),
        PostNew(author: author, description: "Мама говорит,что я красивый", image: #imageLiteral(resourceName: "park"), likes: "Likes: 12", viewsCount: "Views: 67")
    ]
    
    //MARK: - Дальше хранение инфы для 0 ячейки в таблице и для экранчика с фото-коллекцией
    public static let photoCollection: [UIImage] = [
        UIImage(named: "1.png")!,
        UIImage(named: "2.png")!,
        UIImage(named: "3.png")!,
        UIImage(named: "4.png")!,
        UIImage(named: "5.png")!,
        UIImage(named: "6.png")!,
        UIImage(named: "7.png")!,
        UIImage(named: "8.png")!,
        UIImage(named: "9.png")!,
        UIImage(named: "10.png")!,
        UIImage(named: "11.png")!,
        UIImage(named: "12.png")!,
        UIImage(named: "13.png")!,
        UIImage(named: "14.png")!,
        UIImage(named: "15.png")!,
        UIImage(named: "16.png")!,
        UIImage(named: "17.png")!,
        UIImage(named: "18.png")!,
        UIImage(named: "19.png")!,
        UIImage(named: "20.png")!
    ]
}
