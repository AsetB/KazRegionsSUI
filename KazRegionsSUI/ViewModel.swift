//
//  ViewModel.swift
//  KazRegionsSUI
//
//  Created by Aset Bakirov on 07.02.2024.
//

import SwiftUI
import SwiftyJSON

class GetRegion: ObservableObject {
    @Published var regionArray = [Region]()
    
    init() {
        updateData()
    }
    
    func updateData() {
        let urlString = "https://demo3359064.mockable.io/KazRegions"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            
            if error != nil {
                print(error?.localizedDescription ?? "Some error")
                return
            }
            let json = try! JSON(data: data!)
            if let resultArray = json.array {
                self.regionArray.removeAll()
                for item in resultArray {
                    let regionItem = Region(json: item)
                    
                    DispatchQueue.main.async {
                        self.regionArray.append(regionItem)
                    }
                }
            }
            
        }.resume()
    }
}
