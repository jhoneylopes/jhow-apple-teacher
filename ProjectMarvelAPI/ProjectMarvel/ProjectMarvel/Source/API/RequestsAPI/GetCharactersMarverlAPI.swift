import Foundation

protocol GetCharactersMarverlAPI {
    func getCharacters(name: String?, completion: @escaping (Result<CharactersResponse, APIError>) -> Void)
}

extension CoreAPIService: GetCharactersMarverlAPI {
    func getCharacters(name: String? = nil, completion: @escaping (Result<CharactersResponse, APIError>) -> Void) {
        var query: [URLQueryItem] = []
        query.append(URLQueryItem(name: "limit", value: "22"))
        if let safeName = name, !safeName.isEmpty {
            query.append(URLQueryItem(name: "name", value: safeName))
        }

        let request = makeRequest(
            path: "/v1/public/characters",
            httpMethod: HTTPMethod.get.name,
            query: query
        )

        perform(request: request, completion: completion)
    }
}
