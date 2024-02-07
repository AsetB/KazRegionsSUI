//
//  ContentView.swift
//  KazRegionsSUI
//
//  Created by Aset Bakirov on 07.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RegionRow: View {
    
    var regionItem: Region
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(regionItem.name)
                .bold()
            Spacer()
                .frame(height: 5)
            WebImage(url: URL(string: regionItem.photo))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 125)
                .clipped()
                .cornerRadius(6.0)
            Spacer()
                .frame(height: 5)
            HStack {
                WebImage(url: URL(string: regionItem.emblem))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 62, height: 62)
                    .clipped()
                VStack(alignment: .leading, spacing: 4) {
                    Text(regionItem.mainCity)
                    Text(regionItem.population)
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 10))
    }
}

struct ContentView: View {
    
    @ObservedObject var regionList = GetRegion()
    
    var body: some View {
        NavigationView {
            List (regionList.regionArray) { regionItem in
                RegionRow(regionItem: regionItem)
            }
            .refreshable {
                self.regionList.updateData()
            }
            .navigationTitle("Kazakhstan regions")
        }
    }
}

#Preview {
    ContentView()
}
