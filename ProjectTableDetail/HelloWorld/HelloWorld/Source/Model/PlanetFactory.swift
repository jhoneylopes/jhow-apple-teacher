import Foundation

struct PlanetFactory {
    static func createPlanet() -> [Planet] {
        let response: [Planet] = [
            Planet(name: "Mercúrio",
                   solarPosition: 1, size: 10, numberOfMoons: 0, imageURL: "Merc"),
            Planet(name: "Vênus",
                   solarPosition: 2, size: 10, numberOfMoons: 0, imageURL: "Merc"),
            Planet(name: "Terra",
                   solarPosition: 3, size: 10, numberOfMoons: 1, imageURL: "Merc"),
            Planet(name: "Marte",
                   solarPosition: 4, size: 10, numberOfMoons: 2, imageURL: "Merc"),
            Planet(name: "Júpiter",
                   solarPosition: 5, size: 10, numberOfMoons: 79, imageURL: "Merc"),
            Planet(name: "Saturno",
                   solarPosition: 6, size: 10, numberOfMoons: 62, imageURL: ""),
            Planet(name: "Urano",
                   solarPosition: 7, size: 10, numberOfMoons: 27, imageURL: ""),
            Planet(name: "Netuno",
                   solarPosition: 8, size: 10, numberOfMoons: 14, imageURL: "")]
        
        return response
    }
}
