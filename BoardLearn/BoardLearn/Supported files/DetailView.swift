//
//  MapView.swift
//  BoardLearn
//
//  Created by Marina Huber on 8/3/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import SwiftUI
import MapKit


struct DetailView : View {
	let message: String

	var body: some View {
		VStack {
			Text(message)
				.font(.largeTitle)
		}
	}
}

/*https://stackoverflow.com/questions/56563660/accessing-mkmapview-elements-as-uiviewrepresentable-in-the-main-contentview-sw

https://www.hackingwithswift.com/example-code/location/adding-places-to-mkmapview-using-mkplacemark
*/
