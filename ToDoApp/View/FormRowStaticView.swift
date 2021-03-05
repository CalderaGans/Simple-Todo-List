//
//  FormRowStaticView.swift
//  ToDoApp
//
//  Created by Fa Ainama Caldera S on 22/02/21.
//


// Perbedaan Dictionary dan Array




import SwiftUI

struct FormRowStaticView: View {
    
    // Jika ada @state data bisa dirubah
    
    // Jika tidak memakai private harus dipanggil di state berikutnya
    
    var icon : String
    var firsttext : String
    var secondText : String

    /*
       Kegunaan Type Annotations adalah buat model yang bisa dirubah2
     
        Type Annotations sama seperti ::root di css
     
     
     
     */

    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8 , style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(firsttext).foregroundColor(Color.gray)
            Spacer()
            Text(secondText)
        }
    }
}



struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear" , firsttext: " Application ", secondText: " Todo ")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
