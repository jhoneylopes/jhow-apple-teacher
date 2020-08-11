import Foundation

private let defaultBaseURL: URL = URL(string: "https://gateway.marvel.com:443")!

class CoreAPIService {
    let networking: Networking
    let baseURL: URL

    init(networking: Networking = URLSession.shared, baseURL: URL = defaultBaseURL) {
        self.networking = networking
        self.baseURL = baseURL
    }

    func perform<T: Decodable>(request: URLRequest,
                               completion: @escaping (Result<T, APIError>) -> Void) {

        func callback(_ result: Result<T, APIError>) {
            DispatchQueue.main.sync { completion(result) }
        }

        networking.perform(with: request) { (data, response, error) in
            if let error = error {
                let apiError = APIError.network(error)
                let result: Result<T, APIError> = .failure(apiError)
                callback(result)
                return
            }
            guard let data = data else {
                let apiError = APIError.noData(response)
                let result: Result<T, APIError> = .failure(apiError)
                callback(result)
                return
            }

            let validStatusCodes = 200..<300

            guard let httpResponse = response as? HTTPURLResponse,
                validStatusCodes.contains(httpResponse.statusCode) else {
                    let apiError = APIError.server(response)
                    let result: Result<T, APIError> = .failure(apiError)
                    callback(result)
                    return
            }

            do {
                let decoder = JSONDecoder()
                let value = try decoder.decode(T.self, from: data)
                let result: Result<T, APIError> = .success(value)
                callback(result)
            } catch {
                let apiError = APIError.decoding(error)
                let result: Result<T, APIError> = .failure(apiError)
                callback(result)
            }
        }
    }

    func makeRequest(path: String, httpMethod: String) -> URLRequest {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        urlComponents.path = path

        let publicKey = "af13838a26462b30770a6cb0ec147645"
        let privateKey = "51197c8676d9b63e464197f5a027f020455f0d94"
        let hash: String = "1" + privateKey + publicKey
        let queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash.md5),

        ]
        urlComponents.queryItems = queryItems

        let url = urlComponents.url!

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        return request
    }
}
