//
//  RowView.swift
//  WithSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/06.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import SwiftUI

struct LandMarkRowView: View {
    
    var landMark: Landmark
    
    var body: some View {
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landMark.name)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LandMarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        // default 생성자 -> 초기화 되지 않은 값에 대하여
        Group {
            LandMarkRowView(landMark: landmarkData[0])
            
            LandMarkRowView(landMark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
