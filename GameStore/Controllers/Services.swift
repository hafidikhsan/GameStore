import Foundation

class Services: ObservableObject {
    let url = "https://api.rawg.io/api/"
    var urlGames = URLComponents(string: "https://api.rawg.io/api/games")!
    private var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "RAWG-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }
        return value
    }
    @Published var status: ApiStatus = .initialized
    var message = ""
    @Published var homeList: HomeListModel?
    @Published var menuList: HomeListModel?
    @Published var searchList: HomeListModel?
    @Published var detail: GameDetail?
    var dataFile: Data?
    func getUrlHomeList(endPoint: String) {
        self.status = .fetching
        urlGames.queryItems = [
            URLQueryItem(name: "key", value: self.apiKey)
        ]
        var request = URLRequest(url: urlGames.url!)
        request.httpMethod = "GET"
        loadData(request: request) { (teams) in
            self.dataFile = teams
            self.decodeToHomeListModel(data: teams)
        }
    }
    func loadData(request: URLRequest, completion:@escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, let data = data else {
                    self.status = .failed
                    self.message = "Error while try fetching data"
                    return
                }
                if response.statusCode == 200 {
                    completion(data)
                } else {
                    self.status = .failed
                    self.message = "Error \(response.statusCode), Data is not complete"
                    return
                }
            }
        }
        task.resume()
    }
    func decodeToHomeListModel(data: Data) {
        let decoder = JSONDecoder()
        if let listData = try? decoder.decode(HomeListModel.self, from: data) as HomeListModel {
            self.homeList = listData
            self.status = .loaded
        } else {
            self.status = .failed
            self.message = "Error, Can't Decode JSON"
            return
        }
    }
    func getUrlMenuList(endPoint: String, value: String) {
        self.status = .fetching
        urlGames.queryItems = [
            URLQueryItem(name: "genres", value: value),
            URLQueryItem(name: "key", value: self.apiKey)
        ]
        var request = URLRequest(url: urlGames.url!)
        request.httpMethod = "GET"
        loadData(request: request) { (teams) in
            self.dataFile = teams
            self.decodeToMenuListModel(data: teams)
        }
    }
    func decodeToMenuListModel(data: Data) {
        let decoder = JSONDecoder()
        if let listData = try? decoder.decode(HomeListModel.self, from: data) as HomeListModel {
            self.menuList = listData
            self.status = .loaded
        } else {
            self.status = .failed
            self.message = "Error, Can't Decode JSON"
            return
        }
    }
    func getUrlSearchList(endPoint: String, value: String) {
        self.status = .fetching
        urlGames.queryItems = [
            URLQueryItem(name: "search", value: value),
            URLQueryItem(name: "key", value: self.apiKey)
        ]
        var request = URLRequest(url: urlGames.url!)
        request.httpMethod = "GET"
        loadData(request: request) { (teams) in
            self.dataFile = teams
            self.decodeToSearchListModel(data: teams)
        }
    }
    func decodeToSearchListModel(data: Data) {
        let decoder = JSONDecoder()
        if let listData = try? decoder.decode(HomeListModel.self, from: data) as HomeListModel {
            self.searchList = listData
            self.status = .loaded
        } else {
            self.status = .failed
            self.message = "Error, Can't Decode JSON"
            return
        }
    }
    func getUrlDetail(endPoint: String, value: Int) {
        self.status = .fetching
        var components = URLComponents(string: "https://api.rawg.io/api/games/"+String(value))!
        components.queryItems = [
            URLQueryItem(name: "key", value: self.apiKey)
        ]
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        loadData(request: request) { (teams) in
            self.dataFile = teams
            self.decodeToDetailModel(data: teams)
        }
    }
    func decodeToDetailModel(data: Data) {
        let decoder = JSONDecoder()
        if let detail = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
            self.detail = detail
            self.status = .loaded
        } else {
            self.status = .failed
            self.message = "Error, Can't Decode JSON"
            return
        }
    }
}
