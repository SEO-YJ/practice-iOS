//
//  Weather.swift
//  apptool_modal_weather
//
//  Created by 서유준 on 2022/11/20.
//

import Foundation

struct Weather: Hashable {
    let title: String
    let description: String
    let imageName: String
    let weatherUrl: String?
}

extension Weather {
    static let list: [Weather] = [Weather(title: "맑음", description: "맑은 날씨(23도~27도)에는 주로 반팔 티셔츠, 얇은 셔츠, 얇은 긴팔 티셔츠, 반바지, 면바지를 입는 것을 추천한다고 합니다. 나가실 때 참고하시길 바랍니다!", imageName: "sun.min", weatherUrl: nil),
                                  Weather(title: "더움", description: "더운 날씨(28도 이상의 경우)에는 민소매, 반팔 티셔츠, 반바지, 핫팬츠, 민소매 원피스, 짧은 치마, 린넨 옷을 추천합니다.", imageName: "sun.max.fill", weatherUrl: nil),
                                  Weather(title: "일출", description: "새해에는 많은 사람들이 일출을 보러 떠납니다!", imageName: "sunrise", weatherUrl: nil),
                                  Weather(title: "일몰", description: "해가 지는 것을 일몰이라고 하죠.", imageName: "sunset", weatherUrl: nil),
                                  Weather(title: "맑음&먼지", description: "맑지만 먼지가 있는 경우 온도가 20도~22도 사이일 경우에는 얇은 가디건, 긴팔 티셔츠, 셔츠, 블라우스, 후드티, 면바지, 슬랙스, 7부 바지, 청바지 등을 주로 입습니다. 먼지가 있을 경우에는 야외활동을 주의 하시고 마스크를 착용하길 권합니다.", imageName: "sun.dust", weatherUrl: nil),
                                  Weather(title: "맑음&바람", description: "맑은 날씨에 바람이 불 경우 17도~19도 사이일 수 있습니다. 이 경우에는 얇은 니트, 얇은 가디건, 얇은 재킷, 후드티, 스웨트 셔츠, 맨투맨, 바람막이, 가디건, 긴바지, 청바지, 슬랙스, 스키니진 등을 입으면 기온에 맞게 의상을 입을 수 있습니다. 감기에 유의하세요!", imageName: "sun.haze", weatherUrl: nil),
                                  Weather(title: "구름", description: "구름이 많이 낀 하루입니다.", imageName: "cloud", weatherUrl: nil),
                                  Weather(title: "바람", description: "바람이 부는 날의 경우 9도~11도 인 경우에는 주로 재킷, 야상, 점퍼, 트렌치 코트, 니트, 청바지, 면바지 등을 입습니다.", imageName: "wind", weatherUrl: nil),
                                  Weather(title: "눈", description: "눈이 오는 추운 겨울입니다. 외출하실때 패딩, 두꺼운 코트, 내복, 목도리, 장갑 등을 착용하세요~~!", imageName: "snow", weatherUrl: nil),]

    static let weatherUrl: [Weather] = [Weather(title: "기상청", description: "버튼을 누르면 기상청 홈페이지로 이동합니다.", imageName: "nationalWeather", weatherUrl: "https://www.weather.go.kr/w/index.do"), Weather(title: "아큐웨더", description: "버튼을 누르면 아큐웨더 홈페이지로 이동합니다.", imageName: "accuWeather", weatherUrl: "https://www.accuweather.com/"), Weather(title: "웨더뉴스", description: "버튼을 누르면 웨더뉴스 홈페이지로 이동합니다.", imageName: "weatherNews", weatherUrl: "https://www.kr-weathernews.com/mv3/html/main.html"), Weather(title: "웨더채널", description: "버튼을 누르면 웨더채널 홈페이지로 이동합니다.", imageName: "weatherChannel", weatherUrl: "https://weather.com/ko-KR/weather/today/l/KSXX0037:1:KS?Goto=Redirected")]
}

/*
 nationalWeather
 accuWeather
 weatherChannel
 weatherNews
 
 28℃ 이상
 민소매, 반팔 티셔츠, 반바지(핫팬츠), 민소매 원피스, 짧은 치마, 린넨
 23℃~27℃
 반팔 티셔츠, 얇은 셔츠, 얇은 긴팔 티셔츠, 반바지, 면바지
 20℃~22℃
 얇은 가디건, 긴팔 티셔츠, 셔츠, 블라우스, 후드티, 면바지, 슬랙스, 7부 바지, 청바지
 17℃~19℃
 얇은 니트, 얇은 가디건, 얇은 재킷, 후드티, 스웨트 셔츠(맨투맨), 바람막이, 가디건, 긴바지, 청바지, 슬랙스, 스키니진
 12℃~16℃
 재킷, 가디건, 청재킷, 야상, 니트, 스웨트 셔츠(맨투맨), 셔츠, 기모 후드티, 청바지, 면바지, 살구색 스타킹
 9℃~11℃
 재킷, 야상, 점퍼, 트렌치 코트, 니트, 청바지, 면바지, 검은색 스타킹, 기모 바지, 레이어드
 5℃~8℃
 코트, 울 코트, 가죽 재킷, 플리스, 내복, 니트, 레깅스, 청바지, 두꺼운 바지, 스카프, 기모
 4℃ 이하
 패딩, 두꺼운 코트, 누빔, 내복, 목도리, 장갑, 기모, 방한용품
 */
/*
 기상청
 https://www.weather.go.kr/w/index.do
 
 아큐웨더
 https://www.accuweather.com/
 
 웨더뉴스
 https://www.kr-weathernews.com/mv3/html/main.html
 
 웨더채널
 https://weather.com/ko-KR/weather/today/l/KSXX0037:1:KS?Goto=Redirected
 */
