import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var weatherData: WeatherModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = ViewModel(withNetworkmanager: WeatherNetworkManager())
        
        viewModel.delegate = self
        viewModel.startProcess()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setData(_ model: WeatherModel) {
        // Do some actions
    }

    private func handleError(_ error: WeatherError) {
        // Do some actions
    }
}

extension ViewController: Delegate {
    func didFinishProcessingRequest(response: Result<WeatherModel, WeatherError>) {
        print("Delegate method called")
        switch response {
        case let .success(model):
            print("Data received: \(model)")
            weatherData = model
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case let .failure(error):
            handleError(error)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let weatherData = weatherData {
            let temperature = weatherData.main.temp
            cell.textLabel?.text = "Temperature: \(temperature)°C"
        }
        
        return cell
    }
}

