//
//  ContentView.swift
//  BiometricUI
//
//  Created by Guru Mahan on 18/01/23.
//

import SwiftUI

struct BiometricView: View {
     var viewModel : BiometricVM?
  
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                 Color(hex:"#53AEF9")
                        .frame(height: UIScreen.main.safeAreaInsets.top)
                    Spacer()
                }
                VStack(spacing: 0){
                    ZStack{
                        HStack{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                HStack(spacing: 0){
                                    Image(systemName: "chevron.backward")
                                        .font(Font.system(size: 22,weight: .semibold))
                                    Text("Back")
                                        .font(Font.fontSFProText(ofSize: 18,weight: .medium))
                                }
                                .foregroundColor(Color(hex: "#147AFC"))
                            }
                            .padding(.leading,12)
                            Spacer()

                        }
                        Text("Biometric".localize)
                            .font(Font.fontSFProText(ofSize: 18,weight: .medium))
                            .foregroundColor(Color(hex: "#4B5563"))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    VStack{
                        if viewModel?.faces.count == 4 {
                            Text("Your face has been captured successfully !".localize)
                                .font(Font.fontSFProText(ofSize: 16, weight: .regular))
                                .foregroundColor(Color(hex: "#16A34A"))
                                .padding()
                        }
                        VStack(alignment: .leading){
                            ForEach(0..<(viewModel?.row ?? 0), id: \.self) { row in
                                HStack {
                                    ForEach(0..<((viewModel?.coluimn(row: row)) ?? 0), id: \.self) { colunm in
                                        ZStack(alignment: .top) {
                                            if let image = viewModel?.getFace(row: row, column: colunm) {
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                            } else {
    //                                            DCImageView(url: URL(string: viewModel.getSignedUrl(row: row, column: colunm)), thumbnail: "person.fill")
                                            }
                                            
                                            HStack {
                                                Spacer()
                                                Button(action: {
                                                    viewModel?.removeFace(row: row, column: colunm) }, label: {
                                                    Image(uiImage: UIImage(systemName: "xmark.circle.fill")!)
                                                        .frame(width: 24, height: 24)
                                                })
                                                .padding(8)
                                            }
                                            
                                        }
                                    }
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 12 - 4)
                                }
                                .frame(height: (UIScreen.main.bounds.width / 2) - 12 - 4, alignment: .leading)
                                .padding(.horizontal, 12)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                   Spacer()
                       
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "#F3F4F6"))
                    footerView
                }
                .frame(maxWidth: .infinity)
                .padding(.top, UIScreen.main.safeAreaInsets.top)
                .padding(.bottom, UIScreen.main.safeAreaInsets.bottom)
            }
            .edgesIgnoringSafeArea(.all)

        }
        
    }
    
    @ViewBuilder var footerView: some View {
        VStack {
            HStack {
                if viewModel?.faces.count == 4 {
                    NavigationLink {
//                        FaceCaptureView { faces in
//                            viewModel.faces = faces
//                        }
                    } label: {
                        Text("Retake".localize)
                            .foregroundColor(Color(hex: "#147AFC"))
                            .font(Font.fontSFProText(ofSize: 16, weight: .medium))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: "#147AFC"), lineWidth: 1)
                            )
                    }
                    Button(action: {
//                        viewModel.submitFaces { status in
//                            if status {
//                                presentationMode.wrappedValue.dismiss()
//                            }
//                        }
                    },
                           label: {
                        GeometryReader { geometry in
                            
                            Text("Submit".localize)
                                .foregroundColor(.white)
                                .font(Font.fontSFProText(ofSize: 16, weight: .medium))
                                .frame(width: geometry.size.width,
                                       height: geometry.size.height)
                        }
                        
                    })
                    .background(Color(hex: "#147AFC"))
                    .cornerRadius(20)
                    
                } else {
                    
                    NavigationLink {
//                        FaceCaptureView(viewModel.faces) { faces in
//                            viewModel.faces = faces
//                        }
                    } label: {
                        Text("Continue".localize)
                            .foregroundColor(.white)
                            .font(Font.fontSFProText(ofSize: 16, weight: .medium))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(hex: "#147AFC"))
                            .cornerRadius(20)
                    }
                }
            }
            .frame(height: 40)
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricView()
    }
}
