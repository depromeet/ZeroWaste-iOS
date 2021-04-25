//
//  StoreMapView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import MapKit
import SwiftUI

struct StoreMapView: View {
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3348, longitude: -122.0090),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ZStack {
            Map(coordinateRegion: $coordinateRegion)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {

                Label("지역명 검색", systemImage: "magnifyingglass.circle.fill")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all, 8)
                    .background(Color.white)
                    .border(Color.black, width: 2)
                    .padding()

                Spacer()

                // MARK: 상점 리스트

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<10) { _ in
                            Text("상점명")
                        }
                    }
                    .background(Color.white)
                }
                .ignoresSafeArea()
                .frame(height: 80)

                // MARK: 상점 등록 버튼

                NavigationLink(destination: RegistStoreView()) {
                    Text("상점 등록하기")
                }
                .buttonStyle(CTAButtonStyle())
                .padding()

            }
        }
    }

}

struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoreMapView()
                .navigationBarTitle("제로웨이스트 상점 지도", displayMode: .inline)
        }
    }
}
