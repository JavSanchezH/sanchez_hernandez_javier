//
//  ContentView.swift
//  QR
//
//  Created by Javier Sánchez on 17/03/24.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var qrInfo = ""
    @State var showResult = false
    @State var showScanner = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button(action: {
                        showScanner = true
                        showResult = false
                    }, label: {
                        HStack {
                            Text("Escanear código QR")
                                .foregroundColor(Color.black)
                            Image("qr")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    })
                    
                    if showResult {
                        VStack(spacing: 10) {
                            Text("Presiona el botón para escanera otro código.")
                                .padding(.bottom, 50)
                                .font(.system(size: 15))
                            Text("QR Info").bold()
                                .padding(.vertical, 5)
                                .font(.system(size: 20))
                            Text(qrInfo).bold()
                                .padding(5)
                                .padding(.horizontal, 25)
                                .font(.system(size: 15))
                        }
                    }
                    
                    if showScanner {
                        CodeScannerView(
                            codeTypes: [.qr],
                            completion: { result in
                                if case let .success(qrInfo) = result {
                                    self.qrInfo = qrInfo.string
                                } else {
                                    self.qrInfo = "No se pudo leer el QR."
                                }
                                showScanner.toggle()
                                showResult.toggle()
                            }
                        )
                        .frame(width: 250, height: 250)
                        .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.green, lineWidth: 3)
                                        
                                    )
                            )
                        .padding(.top, 100)
                    }
                }
            }
            .padding(.vertical, 50)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
