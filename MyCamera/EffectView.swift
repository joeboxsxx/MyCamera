//
//  EffectView.swift
//  MyCamera
//
//  Created by 戸上健太 on 2023/03/06.
//

import SwiftUI

struct EffectView: View {
    // エフェクト編集画面(sheet)の開閉状態の管理
    @Binding var isShowSheet: Bool
    // 撮影した写真
    let captureImage: UIImage
    // 表示する写真
    @State var showImage: UIImage?
    
    var body: some View {
        VStack {
            Spacer()
            
            if let showImage {
                Image(uiImage: showImage)
                    .resizable()
                    .scaledToFit()
            }
            
            Spacer()
            
            // 「エフェクト」ボタン
            Button {
                
            } label: {
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            
            //showImageをアンラップする
            if let showImage,
               // captureImageから共有する画像を生成する
               let shareImage = Image(uiImage: showImage) {
                ShareLink(item: shareImage, subject: nil, message: nil, preview: SharePreview("Photo", image: shareImage)) {
                    Text("シェア")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                .padding()
            }
            
            // 「閉じる」ボタン
            Button {
                
            } label: {
                Text("閉じる")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        
        // 写真が表示されるときに実行される
        .onAppear{
            // 撮影した写真を表示する写真に設定
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(
            isShowSheet: .constant(true),
            captureImage: UIImage(named: "preview_use")!
        )
    }
}
