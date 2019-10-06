//
//  CircleImage.swift
//  Chapter1
//
//  Created by ParkHyunsoo on 2019/10/05.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    
    var image: Image
    
    // view에 생성자 이용방식 -> 기존이랑 똑같음
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
