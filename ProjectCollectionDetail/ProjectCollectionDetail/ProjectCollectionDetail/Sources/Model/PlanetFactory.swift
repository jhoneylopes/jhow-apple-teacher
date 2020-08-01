import Foundation

struct PlanetFactory {
    static func createPlanet() -> [PlanetModel] {
        let response = [
            PlanetModel(title: "Mercúrio", curiosity: [
                "Planeta quentinho: Como Mercúrio está tão perto do sol, a temperatura de sua superfície pode chegar a tórridos 450 graus Celsius.",
                "Tamanho e crateras: Para ter uma noção do tamanho de Mercúrio, ele é apenas um pouco maior que a Lua da Terra.",
                "Descobertas: Apesar de estar tão perto do Sol, em 2012, a sonda Messenger (da NASA) descobriu água congelada nas crateras em torno de seu polo norte.",
            "Um ano em Mercúrio tem apenas 88 dias de duração",
            "Apenas duas espaçonaves já visitaram Mercúrio",
            "Mercúrio tem apenas 38% da gravidade da Terra",
            "Apesar de o campo magnético de Mercúrio ter apenas 1% da força da Terra, ele é muito ativo."], imageName: "Merc"),
            PlanetModel(title: "Vênus", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Terra", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Marte", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Júpiter", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Saturno", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Urano", curiosity: ["1", "2", "3"], imageName: "Merc"),
            PlanetModel(title: "Netuno", curiosity: ["1", "2", "3"], imageName: "Merc")
        ]
        return response
    }
}
