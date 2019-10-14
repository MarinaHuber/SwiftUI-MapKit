//
//  ContentView.swift
//  BoardLearn
//
//  Created by Marina Huber on 8/1/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import SwiftUI
import Combine
import CoreLocation

struct Landmark: Equatable {
    static func ==(lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }

    let id = UUID().uuidString
    let name: String
    let location: CLLocationCoordinate2D
}

enum TabIdentifier {
    case list
    case another
}
//let boards = [
//	Boards(name: "RipCurl", size: 7),
//	Boards(name: "Devil", size: 5)]
//
//struct Boards {
//	var name: String
//	var size: Double
//}

struct ContentView : View {
    @State var boardLandmarks: [Landmark] = [
        Landmark(name: "Sydney Harbour Bridge", location: .init(latitude: -33.852222, longitude: 151.210556)),
        Landmark(name: "Brooklyn Bridge", location: .init(latitude: 40.706, longitude: -73.997)),
        Landmark(name: "Golden Gate Bridge", location: .init(latitude: 37.819722, longitude: -122.478611))
    ]

    @State var selectedLandmark: Landmark? = nil


	private let messages = [
		"Hello", "How are you?"
	]

	var body: some View {



		NavigationView {



			VStack {
				MapView(landmarks: $boardLandmarks,
                    selectedLandmark: $selectedLandmark)
					.edgesIgnoringSafeArea(.all)
					.frame(height: 260)


			    List(messages, id: \.self) { message in
				NavigationLink(destination: DetailView(message: message)) {
					Text(message)
				  }

				}
					TabView() {
				// here add new view ImagePicker
						Rectangle()

						.foregroundColor(.blue)
						.edgesIgnoringSafeArea(.all)
						.tabItem {
							Text("Take a pic")
						}

				}


			}.navigationBarTitle("Boards found")
				.padding(.top)
		}



	}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
              Group {
		   ContentView()
//			  .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
//			  .previewDisplayName("iPhone SE")

//		   ContentView()
//			  .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
//			  .previewDisplayName("iPhone XS Max")
		}
    }
}
#endif

