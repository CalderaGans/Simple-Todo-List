import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var name:String = ""
    @State private var priority:String = "Normal"
    
    @State private var showingError : Bool = false
    @State private var errorTitle : String = ""
    @State private var errorMessage : String = ""

    let priorities = ["High","Normal","Low"]
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading,spacing: 20){
                    TextField("Todo", text:$name)
                        .padding()
                        .background(Color(UIColor .tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24,weight: .bold,design: .default))
                    
                    
                    Picker("Priority", selection:$priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        if self.name != ""{
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try self.managedObjectContext.save()
                                print("New Todo : \(todo.name ?? ""), Priority :\(todo.priority ?? "")")
                            }catch{
                                print(error)
                            }
                        
                        }else{
                            self.showingError = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Isi bagian kosong"
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Save")
                            .font(.system(size: 24,weight: .bold,design: .default))
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical,30)
                Spacer()
            }
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }){
                                        Image(systemName: "xmark")
                                    }
            ).alert(isPresented: $showingError){
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("ok")))
            }
        }
    }
    
    
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
