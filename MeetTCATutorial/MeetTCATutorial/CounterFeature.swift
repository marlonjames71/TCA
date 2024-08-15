//
//  CounterFeature.swift
//  MeetTCATutorial
//
//  Created by Marlon Raskin on 2024-08-15.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Reducer

@Reducer
struct CounterFeature {
	
	@ObservableState
	struct State {
		var count = 0
	}
	
	enum Action {
		case decrementButtonTapped
		case incrementButtonTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .decrementButtonTapped:
				state.count -= 1
				return .none
			case .incrementButtonTapped:
				state.count += 1
				return .none
			}
		}
	}
}

// MARK: - View

struct CounterView: View {
	
	let store: StoreOf<CounterFeature>
	
	var body: some View {
		VStack {
			Text("\(store.count)")
				.font(.largeTitle)
				.fontWeight(.bold)
				.fontDesign(.monospaced)
			
			HStack {
				Button {
					store.send(.decrementButtonTapped)
				} label: {
					Image(systemName: "minus")
						.frame(width: 40, height: 30)
				}
				Button {
					store.send(.incrementButtonTapped)
				} label: {
					Image(systemName: "plus")
						.frame(width: 40, height: 30)
				}
			}
			.foregroundStyle(.primary)
			.buttonStyle(.bordered)
		}
	}
}

#Preview {
	CounterView(
		store: .init(initialState: CounterFeature.State()) {
			CounterFeature()
		}
	)
}
