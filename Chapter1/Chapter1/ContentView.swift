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

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Turtle Rock")
                // 여기서 아래 붙는놈들은 modifier
                // Your code is always the source of truth for the view. -> inspector에서 변하건 modifier를 통해 변하건
                .font(.largeTitle)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                // Spacer는 내용에의한 크기를 갖지 않고 상위뷰의 모든 공간을 채운다
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
