//
//  InputView.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/3/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if(isSecuredField){
                SecureField(placeholder,text:$text)
                    .font(.system(size: 14))
            }else{
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                
            }
            
            Divider()
        }
    }
}

struct InputViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            InputView(text: .constant(""), title: "Email Address",
                      placeholder: "test@email.com")
        }
    }
}

