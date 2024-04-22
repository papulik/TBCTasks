import Foundation

protocol Delegate {
    func didFinishProcessingRequest(response: Result<WeatherModel, WeatherError>)
}

protocol NetworkManager {
    func getWeather(completiton: @escaping(Result<WeatherModel, WeatherError>)->Void)
}

class ViewModel {
    var delegate: Delegate?

    var networkManager: NetworkManager

    init(withNetworkmanager networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func startProcess() {
        print("Network process started")
        networkManager.getWeather { result in
            print("Network process completed")
            self.delegate?.didFinishProcessingRequest(response: result)
        }
    }
}
