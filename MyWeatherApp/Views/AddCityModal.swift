//
//  AddCityModal.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/12/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct AddCityModal: View {
    @ObservedObject var controller: WeatherDataController;
    @Environment(\.presentationMode) var presentationMode;
    @State var isPending: Bool = false;
    @State var city: String = "";
    @State var suggestions: [LocationSuggestion] = [];
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter city name...", text: $city)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 0.5)
                    )
                    
                Button(action: {
                    self.isPending = true;
                    self.getSuggestions();
                    self.isPending = false;
                }) {
                    Text("Search")
                }.disabled(self.city == "" || self.isPending);
            }.padding(.top)
            
            if self.isPending {
                List {
                    Text("Loading...").foregroundColor(Color.gray)
                }
            } else {
                List(suggestions) { suggestion in
                    Button(action: {
                        print("Adding new city: \(suggestion.name)")
                        self.controller.addCity(newCity: suggestion.name);
                        self.presentationMode.wrappedValue.dismiss();
                    }) {
                        Text(suggestion.name)
                    }
                }
            }
        }.padding()
    }
    
    func getSuggestions() {
        print("Fetching city suggestions for search term: \(self.city)...\n")
        var suggestions: [LocationSuggestion] = [];
        
        do {
            let jsonData = try getCitySuggestions(city: city);
            suggestions = try decodeCitySuggestions(data: jsonData!) ?? [];
            print("Finished fetching city suggestions for \(city)!")
            self.suggestions = suggestions;
        } catch NetworkError.standard(let message) {
            print("Unable to load city suggestions for \(city):")
            print("\(message)\n");
        } catch NetworkError.statusCode(let message) {
            print("Unable to load city suggestions for \(city):")
            print("\(message)\n");
        } catch NetworkError.url(let message) {
            print("Unable to load city suggestions for \(city):")
            print("\(message)\n");
        } catch NetworkError.timeout(let message) {
            print("Unable to load city suggestions for \(city):")
            print("\(message)\n");
        } catch {
            print("Unexpected error while fetching city suggestions for \(city): \n");
            print("\(error)\n")
        }
    }
}

struct AddCityModal_Previews: PreviewProvider {
    static var previews: some View {
        return AddCityModal(controller: WeatherDataController())
    }
}
