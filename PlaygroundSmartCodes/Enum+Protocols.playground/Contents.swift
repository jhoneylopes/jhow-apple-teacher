import Foundation

//
enum ServiceError: String, Error {
    case network
    case service = "500"
    case pageNotFound = "404"
    case unknowed
}

enum ServiceStatus: String {
    case success = "200"
    case error
}

func getService(completion: (String) -> Void) {
    completion("500")
}

getService { statusCode in
    switch ServiceStatus(rawValue: statusCode) {
    case .success:
        print("Sucesso!")
    default:
        switch ServiceError(rawValue: statusCode) {
        case .network:
            print("network")
        case .service:
            print("service")
        case .pageNotFound:
            print("pageNotFound")
        default:
            print("Erro geral.")
        }
    }
}

//

enum State {
    case initial(Int)
    case loading(String)
    case loaded([String: String], ServiceError?)
    case none
}

var state: State = State.initial(0)
//print(state)

state = .loading("Carregando!")
//print(state)

state = .loaded(["user_name": "Jhoney", "age": "32"], nil)
//print(state)

switch state {
case .initial:
    print("Inicializando a home!")
case .loading(let message):
    print(message)
case let .loaded(data, error):
    print("info: \(data) e \(error ?? ServiceError.unknowed)")
default:
    print("Error")
}
