//
//  FigureModel.swift
//  apptool_uicollectionview_grid_figure
//
//  Created by 서유준 on 2022/11/01.
//

import Foundation

struct FigureModel: Hashable {
    let figureIcon: String
    let figureName: String
}

extension FigureModel {
    
    static let list = [
    FigureModel(figureIcon: "circle", figureName: "원"),
    FigureModel(figureIcon: "square", figureName: "정사각형"),
    FigureModel(figureIcon: "rectangle", figureName: "직사각형"),
    FigureModel(figureIcon: "capsule", figureName: "캡슐"),
    FigureModel(figureIcon: "oval", figureName: "타원형"),
    FigureModel(figureIcon: "triangle", figureName: "삼각형"),
    FigureModel(figureIcon: "diamond", figureName: "다이아몬드"),
    FigureModel(figureIcon: "octagon", figureName: "정팔각형"),
    FigureModel(figureIcon: "hexagon", figureName: "정육각형"),
    FigureModel(figureIcon: "pentagon", figureName: "정오각형"),
    FigureModel(figureIcon: "circle", figureName: "English: Circle"),
    FigureModel(figureIcon: "square", figureName: "English: Square"),
    FigureModel(figureIcon: "rectangle", figureName: "English: Rectangle"),
    FigureModel(figureIcon: "capsule", figureName: "English: Capsule"),
    FigureModel(figureIcon: "oval", figureName: "English: Oval"),
    FigureModel(figureIcon: "triangle", figureName: "English: Triangle"),
    FigureModel(figureIcon: "diamond", figureName: "English: Diamond"),
    FigureModel(figureIcon: "octagon", figureName: "English: Ocatagon"),
    FigureModel(figureIcon: "hexagon", figureName: "English: Hexagon"),
    FigureModel(figureIcon: "pentagon", figureName: "English: Pentagon")
    ]
}
