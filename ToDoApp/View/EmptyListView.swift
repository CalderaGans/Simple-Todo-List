//
//  EmptyListView.swift
//  ToDoApp
//
//  Created by Fa Ainama Caldera S on 18/02/21.
//

import SwiftUI

struct EmptyListView: View {
    
    @State private var isAnimated: Bool = false
    
    // [ String ] dideklarasikan untuk bisa diganti2 gambar dalam animasi
    let images :  [String]  = [
        // Array Buat Animasi Gambar
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
    // [ String ] dideklarasikan untuk bisa diganti2 text dalam animasi
    let tips : [String] = [
        // Array buat kata2 bisa diganti
        "Ay AY AY AY AY",
        " Yare Yare Daze",
        "Wryyyyyyyy"
    ]
    
    var body: some View {
        ZStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                Image("\(images .randomElement() ?? self .images[0])") // String Interpolation , dan untuk mengambil string gambar secara acak
                    .resizable()
                    .frame(minWidth: 256 , idealWidth: 280, maxWidth: 360 , minHeight: 256, idealHeight: 280 , maxHeight: 360 , alignment: .center)
                Text("\(tips .randomElement() ?? self .tips[0])") // String Interpolation , dan untuk mengambil string gambar secara acak
                    .font(.system(.headline, design: .rounded))
            }
            .padding()
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50) // bentuk if else yg lebih singkat
            .animation(.easeOut(duration: 1.5))
            .onAppear(perform: {
                self.isAnimated.toggle() // toggle = menampilkan State isAnimated dari false menjadi true 
            })
                
            }
        
        .frame(minWidth: 0 ,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        }
    }


struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView().environment(\.colorScheme , .dark)
    }
}
