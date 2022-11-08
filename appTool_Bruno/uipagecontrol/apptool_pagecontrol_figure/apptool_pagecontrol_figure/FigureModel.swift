//
//  DataModel.swift
//  apptool_pagecontrol_figure
//
//  Created by 서유준 on 2022/11/07.
//

import Foundation

struct FigureModel {
    let figureIcon: String
    let figureName: String
    
    
}

extension FigureModel {
    // 틀린것 1: 왜 static으로 선언?
    /*
     static으로 선언 안 할시 에러 발생
     : extensions must not contain stored properties
     */
    
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
    FigureModel(figureIcon: "pentagon", figureName: "정오각형")
    ]
}
