//
//  SwiftUIView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import SwiftUI

struct LabelBaby: View {
    let baby : BabyData
    @State private var addTask: Bool = false
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 100,height: 110)
                    .foregroundColor(Color("ColorVerde"))
                    .offset(y:8)
                Image(baby.profileImageName)
                    .resizable()
                    .frame(width: 90,height: 90)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .padding(.top)
            }
            .padding(.leading,15)
            .padding(.bottom,15)
            VStack(alignment:.leading){
                Text(baby.name)
                    .font(.title)
                    .bold()
                let difference = baby.birthday.differenceInMonthsAndWeeks(to: Date())
                if difference.weeks > 0 {
                    Text("\(difference.months) meses, \(difference.weeks) semanas")
                        .font(.footnote)
                        .fontWeight(.light)
                } else {
                    Text("\(difference.months) meses")
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.leading,-80)
            Button(action: {
                addTask.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .foregroundColor(.verdoso)
                    .padding(.trailing,-15)
            }
            .padding(.leading,-60)
            
        }
        
        .frame(width: 325,height: 150)
        .background(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius: 3, x:0.5, y:2)
            
        )
        .sheet( isPresented: $addTask){
            AddTaskView()
            
        }
    }
}

struct LabelBaby_Previews: PreviewProvider {
    static var previews: some View {
        LabelBaby(baby:BabyData.Babies[0])
    }
}
