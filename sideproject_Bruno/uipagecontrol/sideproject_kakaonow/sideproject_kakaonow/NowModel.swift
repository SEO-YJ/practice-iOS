//
//  NowModel.swift
//  sideproject_kakaonow
//
//  Created by 서유준 on 2022/11/07.
//

import Foundation

struct NowModel {
    let imageName: String
}

extension NowModel {
    static let list: [NowModel] = [
        NowModel(imageName: "img_nike_nrc"),
        NowModel(imageName: "img_nike_solo_run"),
        NowModel(imageName: "img_nike_group_run"),
        NowModel(imageName: "img_nike_nrc"),
        NowModel(imageName: "img_nike_solo_run"),
        NowModel(imageName: "img_nike_group_run")
        ]
}
