import Foundation

enum FilterCharacters: String {
    case name
    case nameStartsWith

    var text: String {
        switch self {
        case .name:
            return "Filtro por nome"
        case .nameStartsWith:
            return "Filtro por palavra inicial"
        }
    }
}

protocol GetCharactersMarverlAPI {
    func getCharacters(name: String?, filter: FilterCharacters, completion: @escaping (Result<CharactersResponse, APIError>) -> Void)
}

extension CoreAPIService: GetCharactersMarverlAPI {
    func getCharacters(name: String? = nil, filter: FilterCharacters = .name, completion: @escaping (Result<CharactersResponse, APIError>) -> Void) {
        var query: [URLQueryItem] = []
        query.append(URLQueryItem(name: "limit", value: "22"))
        if let safeName = name, !safeName.isEmpty {
            query.append(URLQueryItem(name: filter.rawValue, value: safeName))
        }

        let request = makeRequest(
            path: "/v1/public/characters",
            httpMethod: HTTPMethod.get.name,
            query: query
        )

        perform(request: request, completion: completion)
    }
}
