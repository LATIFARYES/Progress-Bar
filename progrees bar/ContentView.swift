//
//  ContentView.swift
//  progrees bar
//
//  Created by LATIFA on 19/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var conttainerwidth: CGFloat = 0
    @State private var progressTitle: String = " "
    
    
    var maxWidth: Double {
       return min((conttainerwidth / CGFloat(goal) * CGFloat(step)), conttainerwidth)
    }
    
    private let goal = 3
    @State private var step = 0
    
    var body: some View {
        ZStack(alignment: .leading){
            GeometryReader{ geo in
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.clear)
                    .onAppear {
                        conttainerwidth = geo.size.width
                    }
                
                
            }
            
           
            RoundedRectangle(cornerRadius: 60)
                .stroke(Color.bordercolor, lineWidth: 1)
            
            ZStack(alignment: .trailing){
                
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color.progresscolor)
                
                Text(progressTitle)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    .background(
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.circlecolor)
                    )
            }
            .padding(2)
            .frame(minWidth: maxWidth)
            .fixedSize()
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(20)
        .onAppear {
            progressTitle = " \(step) / \(goal)"
        }
        Button(" Start ") {
            guard step < goal else { return }
            
            withAnimation {
                step += 1
            }
         
            progressTitle = " \(step) / \(goal)"
        }
        .tint(Color.circlecolor)
    
        }
    }




#Preview {
    ContentView()
}
