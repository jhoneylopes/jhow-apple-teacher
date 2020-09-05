import Foundation

protocol GetComicsMarverlAPI {
    func getComics(completion: @escaping (Result<ComicsResponse, APIError>) -> Void)
}

extension CoreAPIService: GetComicsMarverlAPI {
    func getComics(completion: @escaping (Result<ComicsResponse, APIError>) -> Void) {
        let request = makeRequest(
            path: "/v1/public/comics",
            httpMethod: HTTPMethod.get.name,
            query: [URLQueryItem(name: "limit", value: "22")]
        )

        perform(request: request, completion: completion)
    }
}
