import SwiftUI


struct DaySchedule: View {
    let colors = [Color.orange, Color.red, Color.teal, Color.green, Color.yellow, Color.blue, Color.purple, Color.cyan]
    @EnvironmentObject var courseData: CourseData
    @State private var selectedDayIndex = 0
    @State var events: [Event]
    
    let hourHeight = 40.0
    
    var body: some View {
      
            
            ScrollView {
                ZStack(alignment: .topLeading) {
                
                    VStack(alignment: .leading, spacing: 0) {
                        
        
                   
                        ForEach(8..<23) { hour in
                            HStack {
                                Text("\(hour)")
                                    .font(.caption)
                                    .frame(width: 20, alignment: .trailing)
                                Color.gray
                                    .frame(height: 1)
                            }
                            .frame(height: hourHeight)
                        }
                    }
                    
                    ForEach(events) { event in
                        eventCell(event)
                    }
                }
            }

    }
    
    func eventCell(_ event: Event) -> some View {
        let end_date = dateFrom(9,5,2023,event.endDate,0)
        let start_date = dateFrom(9,5,2023,event.startDate,0)
        let duration = end_date.timeIntervalSince(start_date)
        let height = duration / 60 / 60 * hourHeight
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: start_date)
        let minute = calendar.component(.minute, from: start_date)
        let offset = Double(hour-8) * (hourHeight) - 4
        
        print(hour, minute, Double(hour-7) + Double(minute)/60 )

        return VStack(alignment: .leading) {
            Text(start_date.formatted(.dateTime.hour().minute()))
            Text(event.title).bold()
        }
        .font(.caption)
        .frame(maxWidth: .infinity/2, alignment: .leading)
        .padding(4)
        .frame(height: height, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(colors.randomElement()!).opacity(0.5)
                
        )
        .padding(.trailing, 30)
        .offset(x: 30, y: offset + 24)

    }
    
}


