//
//  ContentView.swift
//  weather
//
//  Created by Sarah Plant on 06/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                Spacer()
                CityTextView(cityName: "Birmingham, UK")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 13 : 18)
        
                HStack(spacing:25){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.haze.fill" : "cloud.sun.fill",
                                   temperature: isNight ? 11 : 18)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "sparkles" : "cloud.bolt.rain.fill",
                                   temperature: isNight ? 12 : 19)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: isNight ? "cloud.moon.fill" : "tornado",
                                   temperature: isNight ? 11 : 17)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "cloud.moon.bolt.fill" : "sun.max.fill",
                                   temperature: isNight ? 9 : 22)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "moon.fill" : "cloud.fill",
                                   temperature: isNight ? 10 : 15)
                }
                Spacer()
                
                Button(isNight ? "Change To Day" : "Change To Night") {
                    isNight.toggle()
                }
                    .frame(width: 280, height: 50)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(10)
                
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        VStack{
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
        }
    }
}

struct MainWeatherView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 70)
    }
}

struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Button(title) {
        }
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
