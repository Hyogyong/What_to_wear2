//
//  MainPageView.swift
//  what to wear
//
//  Created by 이효경 on 2022/04/28.
//

import SwiftUI


struct MainPageView: View {
    @EnvironmentObject var network: Network
    private var temp: String { String(format: "%.1f", (network.weather.main.temp-273.15)) }
    
    
    //    func getWeatherImage(iconName: String) -> String {
    //        switch iconName {
    //        case "01d":
    //            return "sun.min.fill" Image(systemName:"sun.min.fill").renderingMode(.original)
    //                .font(.system(size:80)) as! Image
    //        case "02d":
    //            return Image(systemName:"cloud.sun.fill").renderingMode(.original).font(.system(size:80)) as! Image
    //        case "03d":
    //            return Image(systemName:"cloud.fill").renderingMode(.original).font(.system(size:80))
    //        case "04d":
    //            Image(systemName:"smoke.fill").renderingMode(.original).font(.system(size:80))
    //        case "09d":
    //            Image(systemName:"cloud.rain.fill").renderingMode(.original).font(.system(size:80))
    //        default:
    //            print("")
    //
    //        }
    //
    //    }
    
    func getWeatherImage(iconName: String) -> String {
        switch iconName {
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.stars.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d":
            return "cloud.fill"
        case "03n":
            return "cloud.fill"
        case "04d":
            return "smoke.fill"
        case "04n":
            return "smoke.fill"
        case "09d":
            return "cloud.rain.fill"
        case "09n":
            return "cloud.rain.fill"
        case "10d":
            return "cloud.sun.rain.fill"
        case "10n":
            return "cloud.moon.rain.fill"
        case "11d":
            return "cloud.sun.bolt.fill"
        case "11n":
            return "cloud.moon.bolt.fill"
        case "13d":
            return "cloud.snow.fill"
        case "13n":
            return "cloud.snow.fill"
        case "50d":
            return "humidity.fill"
        case "50n":
            return "humidity.fill"
        default:
            return "---"
            
        }
        
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:  [.blue,.white]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
            VStack{
                HStack{
                    VStack {
                        Text("포항시").font(.custom("dovemayo-bold", size: 35)).foregroundColor(.white).padding(EdgeInsets(top:20, leading: 20, bottom:0,trailing:0))

                        Text("\(temp)°").font(.custom("dovemayo-bold", size: 50))
                            .foregroundColor(.white).padding(EdgeInsets(top:0, leading: 20, bottom:0,trailing:0))
                        
                    }
                                        
                    
                    Image(systemName: getWeatherImage(iconName: network.weather.weather.first?.icon ?? ""))
                        .renderingMode(.original)
                        .font(.system(size:100)).padding(.bottom)
                    
                    
                }.padding(.top,50)
                Spacer()
                Image("23-27").resizable().aspectRatio(contentMode: .fit).padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                
                            
            }
            
            
        }
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .environmentObject(Network())
    }
}
