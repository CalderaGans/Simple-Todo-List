//
//  SettingsView.swift
//  ToDoApp
//
//  Created by Fa Ainama Caldera S on 22/02/21.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // Untuk memanggil data atau mengambil data dari SceneDelegate ( Icon )
    @EnvironmentObject var iconSettings : IconNames
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Form{
                    Section(header: Text("Choose the app icon")){
                        Picker(selection: $iconSettings.currentIndex /* currentIndex memanggil urutan yang paling awal array pertama */, label: Text("App Icons")){
                            
                            // Perulanagan untuk dihitung 
                            ForEach(0..<iconSettings.iconNames.count){index in
                                HStack{
                                    Image(uiImage: UIImage(named:  self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44,height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(self.iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)/* Kejadian jika icon tidak muncul maka muncul gambar yang utama yaitu blue */
                                }
                                .padding(3)
                            }
                        }
                        .onReceive([self.iconSettings.currentIndex].publisher.first()){
                            (value) in
                            let index = self.iconSettings.iconNames.firstIndex(of:
                                                                                UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                // Kejadian icon tidak terpanggil akan muncul eror
                                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]){
                                    error in
                                    if let error = error {
                                        print(error.localizedDescription)   // Kejadian false
                                    }else{
                                        print("Success")
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical,3)
                    
                    Section(header: Text("Follow me on my social media")){
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "My Website", link: "mora-hakim.web.app")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "")
                        FormRowLinkView(icon: "desktop", color: Color.purple, text: "Instagram", link: "")
                    }
                    .padding(.vertical,3)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular) //style horizontal yang tepi kanan dan kiri ny ga rapet ke kanan dan kiri. kalo style yg lain namanya .compact = fungsi ny kebalikan yg regular
                
                Text("Copyright All rights reserved. Less code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top,6)
                    .padding(.bottom,8)
                    .foregroundColor(.secondary)
            }
            .navigationBarTitle("New Todo" ,displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()  // PresentationMode untuk menutup suatu halaman dan kembali ke halaman  sebelumnya ( Sudah Satu Paket )
                                    }){
                                        Image(systemName : "xmark")
                                    }
            )
            
            .navigationBarTitle("Settings",displayMode: .inline)
            .background(Color("ColorBase")).edgesIgnoringSafeArea(.all)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
