//
//  ContentView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 05.07.2021.
//

import SwiftUI
import SwiftUIX
import CoreData

struct ContentView: View {
    // is Dark Mode ?
    @Environment(\.colorScheme) var colorScheme
    
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    
    // Add new task sheet
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            backgroundDark.ignoresSafeArea()
            
            VStack (alignment: .leading) {
                
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                WhatsNextView()
                
                PointsView()
                
            }
            .padding(.leading)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: PointsView()) {
                        Text("GO MESSI")
                    }
                }
            }
        }
            
    }
    
    
    
    var backgroundLight: some View {
        ZStack {
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.08235293626785278, green: 0.615976870059967, blue: 0.7019608020782471, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.48627451062202454, green: 0.8705882430076599, blue: 0.8039215803146362, alpha: 1)), location: 0.4583333432674408),
                    .init(color: Color(#colorLiteral(red: 0.929411768913269, green: 0.9725490212440491, blue: 0.9411764740943909, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.07466670248076868, y: 0.9913793057985952),
                        endPoint: UnitPoint(x: 1.0000000414261934, y: -0.061576355107382574))
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(0.5)]), startPoint: .bottom, endPoint: .top)
        }
    }
    
    var backgroundDark: some View {
        ZStack {
            LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.24313725531101227, green: 0.0784313753247261, blue: 0.6509804129600525, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.24313725531101227, green: 0.09019608050584793, blue: 0.658823549747467, alpha: 1)), location: 0.00009999999747378752),
                .init(color: Color(#colorLiteral(red: 0.33725491166114807, green: 0.22745098173618317, blue: 0.7098039388656616, alpha: 1)), location: 0.4583333432674408),
                .init(color: Color(#colorLiteral(red: 0.42352941632270813, green: 0.364705890417099, blue: 0.8235294222831726, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.07466670248076868, y: 0.9913793057985952),
                    endPoint: UnitPoint(x: 1.0000000414261934, y: -0.061576355107382574))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
