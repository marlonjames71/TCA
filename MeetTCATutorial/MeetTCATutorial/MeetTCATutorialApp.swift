//
//  MeetTCATutorialApp.swift
//  MeetTCATutorial
//
//  Created by Marlon Raskin on 2024-08-15.
//

import ComposableArchitecture
import SwiftUI

@main
struct MeetTCATutorialApp: App {
	static let store = Store(initialState: CounterFeature.State()) {
		CounterFeature()
			._printChanges()
	}
	
	var body: some Scene {
		WindowGroup {
			CounterView(store: MeetTCATutorialApp.store)
		}
	}
}
