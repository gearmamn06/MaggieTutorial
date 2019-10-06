//
//  ContentView.swift
//  Chapter1
//
//  Created by ParkHyunsoo on 2019/10/04.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import SwiftUI

/**
 swiftUI를 통해서 content layout과 behavior를 정의해야함
 하지만 view는 singleView만을 리턴 -> Stack을 이용하여 여러 뷰 합성 가능
 */

struct LandmarkDetailView: View {
    
    var landMark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landMark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                // width가 정의되있지 않다면 contentSize로 자동 맞춤 -> 이경우 mapView가 가능한 모든 스페이스 차지
                .frame(height: 300)
            
            CircleImage(image: landMark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(landMark.name)
                    // 여기서 아래 붙는놈들은 modifier
                    // Your code is always the source of truth for the view. -> inspector에서 변하건 modifier를 통해 변하건
                    .font(.largeTitle)
                HStack {
                    Text(landMark.park)
                        .font(.subheadline)
                    Spacer()
                    // Spacer는 내용에의한 크기를 갖지 않고 상위뷰의 모든 공간을 채운다
                    Text(landMark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
                .frame(height: 100)
        }
    }
}


struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landMark: landmarkData[0])
    }
}
