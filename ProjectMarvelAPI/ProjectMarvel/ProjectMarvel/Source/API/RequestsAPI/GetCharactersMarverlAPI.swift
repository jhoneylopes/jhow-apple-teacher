protocol GetCharactersMarverlAPI {
    func getCharacters(completion: @escaping (Result<CharactersResponse, APIError>) -> Void)
}

extension CoreAPIService: GetCharactersMarverlAPI {
    func getCharacters(completion: @escaping (Result<CharactersResponse, APIError>) -> Void) {
        let request = makeRequest(
            path: "/v1/public/characters",
            httpMethod: HTTPMethod.get.name
        )

        perform(request: request, completion: completion)
    }
}
