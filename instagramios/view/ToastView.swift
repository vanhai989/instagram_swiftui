//
//  ToastView.swift
//  instagramios
//
//  Created by Hai Dev on 15/06/2022.
//

import SwiftUI

//struct ToastView<Presenting>: View where Presenting: View {
//
//    /// The binding that decides the appropriate drawing in the body.
//    @Binding var isShowing: Bool
//    /// The view that will be "presenting" this toast
//    let presenting: () -> Presenting
//    /// The text to show
//    let text: Text
//
//    var body: some View {
//
//        GeometryReader { geometry in
//
//            ZStack(alignment: .center) {
//
//                self.presenting()
//                    .blur(radius: self.isShowing ? 1 : 0)
//
//                VStack {
//                    self.text
//                }
//                .frame(width: geometry.size.width / 2,
//                       height: geometry.size.height / 5)
//                .background(Color.secondary.colorInvert())
//                .foregroundColor(Color.primary)
//                .cornerRadius(20)
//                .transition(.slide)
//                .opacity(self.isShowing ? 1 : 0)
//
//            }
//
//        }
//
//    }
//
//struct ToastView_Previews: PreviewProvider {
//    @State var showToast: Bool = false
//    static var previews: some View {
//        ToastView(isShowing: $showToast, text: Text("Hello toast!"))
//    }
//}
