//
//  LandMarkListView.swift
//  WithSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/06.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import SwiftUI

struct LandMarkListView: View {
    var body: some View {

        // MARK: List는 identifiable 프로토콜을 따르거나 unique keypath를 전달하는 데이터에 대하여 작동한다. -> []가 바로 list로 대입
        NavigationView {
            List(landmarkData) { landMark in
                NavigationLink(destination: LandmarkDetailView(landMark: landMark)) {
                    LandMarkRowView(landMark: landMark)
                }
            }
        }
    }
}

struct LandMarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkListView()
    }
}



extension Landmark: Identifiable {
    // 이미 Landmrk가 Identifiable protocol의 id 값을 정의하고 있으므로 따로 뭐 안해줘도 ok
}
