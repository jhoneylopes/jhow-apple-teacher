///
/// How to use Result<Success, Failure>
///

// Enum
enum APIError: Error {
    case network
    case service
}

// Func
func getCharacters(completion: @escaping (Result<Int, APIError>) -> Void) {
    foo(bar: completion)
}

func foo(bar: @escaping (Result<Int, APIError>) -> Void) {

    bar(.success(99))
//    bar(.failure(APIError.service))

}

// Execute Completion/Clousures
getCharacters { response in
    switch response {
    case .success(let data):
        print("Success \(data)")
    case .failure(let error):
        switch error {
        case .network:
            print("Vocês está sem internet")
        case .service:
            print("Site fora do ar")
        }
    }
}
