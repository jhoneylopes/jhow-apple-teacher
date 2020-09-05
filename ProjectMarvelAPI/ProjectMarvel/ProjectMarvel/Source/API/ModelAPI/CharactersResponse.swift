struct CharactersResponse: Decodable {
    let copyright: String
    let code: Int
    let data: CharactersData
}

struct CharactersData: Decodable {
    let offset: Int
    let results: [CharactersResult]
}

struct CharactersResult: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    let path: String
    let `extension`: String
}
