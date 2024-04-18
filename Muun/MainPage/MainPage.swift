//
//  SwiftUIView.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 19/10/23.
//

import SwiftUI

struct MainPage: View {
    @Environment(ViewModel.self) var viewModel
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @GestureState private var dragOffset = CGSize.zero
    private let calendar: Calendar
    private let monthDayFormatter: DateFormatter
    private let dayFormatter: DateFormatter
    private let weekDayFormatter: DateFormatter
    private let timeFormatter: DateFormatter
    private let MonthFormatter: DateFormatter
    private var mom: Binding<MomData?>
    
    @State private var showFullCalendar: Bool = false
    @State private var isPendientesSelected: Bool = false
    
    @State private var selectedDate = Self.now
    private static var now = Date()
    @State private var selectedTaskType: TaskType? = nil
    
    init(calendar: Calendar, mom: Binding<MomData?>) {
        
        self.mom = mom
        self.calendar = calendar
        
        self.monthDayFormatter = DateFormatter(dateFormat: "dd/MM", calendar: calendar, locale: Locale(identifier: "es_MX"))
        self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar, locale: Locale(identifier: "es_MX"))
        self.weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar, locale: Locale(identifier: "es_MX"))
        
        self.timeFormatter = DateFormatter(dateFormat: "H:mm", calendar: calendar, locale: Locale(identifier: "es_MX"))
        
        self.MonthFormatter = DateFormatter(dateFormat: "MMMM", calendar: calendar, locale: Locale(identifier: "es_MX"))

    }
    
   
    
    var body: some View {
        ZStack{
            BackGroundMainPage()
            
            VStack{
                
                ScrollView() {
                    if let mom = self.mom.wrappedValue {
                        if let baby = mom.baby {
                            LabelBaby(baby: baby)
                        } else {
                            Text("No hay información del bebé")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 20)
                        }
                    } else {
                        Text("No hay información de la mamá")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading, 20)
                    }

                    HStack {
                        HStack(alignment: .center, spacing: 10) {
                            Button(action: {
                                showFullCalendar.toggle()
                            }, label: {
                                Text("Hoy")
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                            })
                            
                            Text(Date().formatted(date: .abbreviated, time: .omitted))
                                .padding(.top,5)
                                .foregroundColor(.gray)
                            
                        }
                        Spacer()
                    }
                    .padding(.leading,25)
                    .padding(.bottom,-5)
                    
                    CalendarWeekListView(
                        calendar: calendar,
                        date: $selectedDate,
                        content: { date in
                            Button(action: {
                                selectedDate = date
                                withAnimation {
                                    taskModel.currentDay = date
                                }
                            }) {
                                VStack(spacing: 5) {
                                    Text(weekDayFormatter.string(from: date).capitalized)
                                        .font(.system(size: 14))
                                    Text(dayFormatter.string(from: date))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                }
                                .foregroundStyle(calendar.isDate(date, inSameDayAs: selectedDate) ? .primary : .secondary)
                                .foregroundColor(calendar.isDate(date, inSameDayAs: selectedDate) ? .white : .gray)
                                .frame(width: 45, height: 45)
                                .background(
                                    ZStack {
                                        if calendar.isDate(date, inSameDayAs: selectedDate) {
                                            Capsule()
                                                .fill(Color(.azulBajito))
                                        }
                                    }
                                )
                            }
                        },
                        title: { date in
                            HStack {
                                Text(MonthFormatter.string(from: selectedDate).capitalized)
                                    .font(.headline)
                                    .padding(5)
                                Spacer()
                            }
                            .padding( .leading, 20)
                            .padding( .bottom, 10)
                        }, weekSwitcher: { date in
                            HStack{
                                Button {
                                    withAnimation(.easeIn) {
                                        guard let newDate = calendar.date(
                                            byAdding: .weekOfMonth,
                                            value: -1,
                                            to: selectedDate
                                        ) else {
                                            return
                                        }
                                        
                                        selectedDate = newDate
                                    }
                                } label: {
                                    Label(
                                        title: { Text("Previous") },
                                        icon: { Image(systemName: "chevron.left")
                                            .foregroundColor(.azulFuerte)}
                                    )
                                    .labelStyle(IconOnlyLabelStyle())
                                    .padding(.horizontal)
                                }
                                Button {
                                    withAnimation(.easeIn) {
                                        guard let newDate = calendar.date(
                                            byAdding: .weekOfMonth,
                                            value: 1,
                                            to: selectedDate
                                        ) else {
                                            return
                                        }
                                        
                                        selectedDate = newDate
                                    }
                                } label: {
                                    Label(
                                        title: { Text("Next") },
                                        icon: { Image(systemName: "chevron.right")
                                            .foregroundColor(.azulFuerte)}
                                    )
                                    .labelStyle(IconOnlyLabelStyle())
                                    .padding(.horizontal)
                                }
                            }
                            .padding( .bottom, 10)
                            .padding(.trailing,20)
                        }
                    )
                    VStack(alignment:.leading){
                        Text("Tareas")
                            .font(.title.bold())
                            .foregroundStyle(.black)
                        TasksView()
                        
                    }
                    
                    .padding(.leading,25)
                }
                
                .padding()
                
            }
            .ignoresSafeArea()
            .padding(.top,10)
            .sheet(isPresented: $showFullCalendar) {
                CompleteCalendar(
                    calendar: calendar,
                    selectedDate: $selectedDate,
                    monthDayFormatter: monthDayFormatter,
                    dayFormatter: dayFormatter,
                    weekDayFormatter: weekDayFormatter,
                    timeFormatter: timeFormatter
                )
            }
        }
        
    }
    func TasksView() -> some View {
        
        VStack(spacing: 20) {
            HStack(spacing: 15) {
                Button("Pendientes") {
                    taskModel.selectedTaskType = nil
                    taskModel.filteredTasks = taskModel.storedTasks.filter { !$0.doneFlag }
                }
                Button("Todas") {
                    taskModel.selectedTaskType = nil
                    taskModel.filterTodayTasks()
                }
                
                Button("Salud") {
                    taskModel.selectedTaskType = .sintomas(detail: Sintomas(nombre: "", severidad: ""))
                    taskModel.filterTodayTasks()
                }
                
                Button("Citas") {
                    taskModel.selectedTaskType = .citasMedicas(detail: CitasMedicas(especialidad: "", motivo: ""))
                    taskModel.filterTodayTasks()
                }
                Button("Rutinas") {
                    taskModel.selectedTaskType = .rutina(detail: Rutina(actividad: ""))
                    taskModel.filterTodayTasks()
                }
            }
            .padding(.top,-5)
            .foregroundStyle(.gray)
            .padding(.leading,-60)
            
            LazyVStack(spacing: 10) {
                if let tasks = taskModel.filteredTasks {
                    if tasks.isEmpty {
                        Text("No Task")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                            .offset(y: 100)
                            .foregroundColor(.gray)
                    } else {
                        ForEach(tasks) { task in
                            TaskCardView(task: task)
                        }
                    }
                } else {
                    ProgressView()
                        .offset(y: 100)
                }
            }

            .ignoresSafeArea()
            .padding(.leading,5)
            .onChange(of: taskModel.currentDay) { oldvalue,newValue in
                taskModel.filterTodayTasks()
            }
        }
        
    }

    func TaskCardView(task: Task) -> some View {
        
        HStack(spacing: 25) {
            VStack(spacing: 5) {
                Rectangle()
                    .fill(.colorVerde)
                    .frame(width: 3)
                Rectangle()
                    .fill(.colorVerde)
                    .frame(width: 3)
                
                Text(task.date.formatted(date: .omitted, time: .shortened))
                    .foregroundStyle(.gray)
                
                Rectangle()
                    .fill(.colorVerde)
                    .frame(width: 3)
                Rectangle()
                    .fill(.colorVerde)
                    .frame(width: 3)
                
            }
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    
                }, label: {
                    HStack{
                        task.type.image
                            .resizable()
                            .frame(width: 31,height: 32)
                            .padding(.top,-15)
                            .padding(.leading,30)
                        VStack{
                            Text(task.title)
                                .font(.title2)
                                .foregroundColor(Color.black)
                                .padding(.leading,10)
                            Text(task.description)
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 30.0)
                            .foregroundStyle(.white)
                            .frame(width: 260, height: 80)
                            .shadow(radius: 1.5,x:0.5,y:2)
                    )
                })
            }
        }
        .frame(width: 350, alignment: .leading)
        .padding(.leading, -40)
    }
    
}


struct mainPageIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 1.05814*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: 0.99893*width, y: 0.81481*height))
        path.addCurve(to: CGPoint(x: 0.70465*width, y: 0.85185*height), control1: CGPoint(x: 0.9406*width, y: 0.85185*height), control2: CGPoint(x: 0.82219*width, y: 0.92593*height))
        path.addCurve(to: CGPoint(x: 0.35116*width, y: 0.55556*height), control1: CGPoint(x: 0.58712*width, y: 0.77778*height), control2: CGPoint(x: 0.4687*width, y: 0.55556*height))
        path.addCurve(to: CGPoint(x: 0.05688*width, y: 0.88889*height), control1: CGPoint(x: 0.23363*width, y: 0.55556*height), control2: CGPoint(x: 0.11521*width, y: 0.77778*height))
        path.addLine(to: CGPoint(x: -0.00233*width, y: height))
        path.addLine(to: CGPoint(x: -0.00233*width, y: 0))
        path.addLine(to: CGPoint(x: 0.05688*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.35116*width, y: 0), control1: CGPoint(x: 0.11521*width, y: 0), control2: CGPoint(x: 0.23363*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.70465*width, y: 0), control1: CGPoint(x: 0.4687*width, y: 0), control2: CGPoint(x: 0.58712*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99893*width, y: 0), control1: CGPoint(x: 0.82219*width, y: 0), control2: CGPoint(x: 0.9406*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05814*width, y: 0))
        path.addLine(to: CGPoint(x: 1.05814*width, y: 0.77778*height))
        path.closeSubpath()
        return path
    }
}

struct BackGroundMainPage: View {
    var body: some View {
        ZStack {
            // Fondo de color crema
            Color("ColorFondo2")
                .edgesIgnoringSafeArea(.all)
            mainPageIcon()
                .foregroundColor(Color("AzulFuerte"))
                .frame(width: 450,height: 200)
                .offset(y:-340)
                .shadow(color: Color.gray.opacity(0.3),radius: 4)
            
            mainPageIcon()
                .foregroundColor(Color("AzulBajito"))
                .frame(width: 450,height: 190)
                .offset(y:-350)

        }
    }
}

// MARK: - Component
struct CompleteCalendar: View {
    
    let calendar: Calendar
    @Binding var selectedDate: Date
    
    // Los formateadores de fecha
    let monthDayFormatter: DateFormatter
    let dayFormatter: DateFormatter
    let weekDayFormatter: DateFormatter
    let timeFormatter: DateFormatter

    init(calendar: Calendar, selectedDate: Binding<Date>, monthDayFormatter: DateFormatter, dayFormatter: DateFormatter, weekDayFormatter: DateFormatter, timeFormatter: DateFormatter) {
        self.calendar = calendar
        self._selectedDate = selectedDate
        self.monthDayFormatter = monthDayFormatter
        self.dayFormatter = dayFormatter
        self.weekDayFormatter = weekDayFormatter
        self.timeFormatter = timeFormatter
    }
    
    var body: some View {
        ZStack{
            Color("ColorFondo2")
                VStack {
                    Text("Hoy")
                        .font(.title.bold())
                        .foregroundStyle(.black)
                    
                    DatePicker("Fecha", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.azulBajito)
                        .labelsHidden()
                }
                .padding()
        }
        
    }
}

// MARK: - Component

public struct CalendarWeekListView<Day: View, Title: View, WeekSwiter: View>: View {
    // Injected dependencies
    private var calendar: Calendar
    @Binding private var date: Date
    private let content: (Date) -> Day
    private let title: (Date) -> Title
    private let weekSwitcher: (Date) -> WeekSwiter
    
    // Constants
    private let daysInWeek = 7
    
    public init(
        calendar: Calendar,
        date: Binding<Date>,
        @ViewBuilder content: @escaping (Date) -> Day,
        @ViewBuilder title: @escaping (Date) -> Title,
        @ViewBuilder weekSwitcher: @escaping (Date) -> WeekSwiter
    ) {
        self.calendar = calendar
        self._date = date
        self.content = content
        self.title = title
        self.weekSwitcher = weekSwitcher
    }
    
    public var body: some View {
        let month = date.startOfMonth(using: calendar)
        let days = makeDays()
        
        VStack {
            HStack {
                self.title(month)
                self.weekSwitcher(month)
            }
            HStack {
                ForEach(days, id: \.self) { date in
                    content(date)
                }
                
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
    
// MARK: - Conformances
    
extension CalendarWeekListView: Equatable {
    public static func == (lhs: CalendarWeekListView<Day, Title, WeekSwiter>, rhs: CalendarWeekListView<Day, Title, WeekSwiter>) -> Bool {
        lhs.calendar == rhs.calendar && lhs.date == rhs.date
    }
}
    
// MARK: - Helpers
    
private extension CalendarWeekListView {
    func makeDays() -> [Date] {
        guard let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: date),
                let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: firstWeek.end - 1)
        else {
            return []
        }
            
        let dateInterval = DateInterval(start: firstWeek.start, end: lastWeek.end)
            
        print(calendar.generateDays(for: dateInterval))
            
        return calendar.generateDays(for: dateInterval)
    }
}
    
private extension Calendar {
    func generateDates(
        for dateInterval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates = [dateInterval.start]
            
        enumerateDates(
            startingAfter: dateInterval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            guard let date = date else { return }
                
            guard date < dateInterval.end else {
                stop = true
                return
            }
                
            dates.append(date)
        }
            
        return dates
    }
        
    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generateDates(
            for: dateInterval,
                matching: dateComponents([.hour, .minute, .second], from: dateInterval.start)
        )
    }
}
    
public extension Date {
    func startOfMonth(using calendar: Calendar) -> Date {
        calendar.date(
            from: calendar.dateComponents([.year, .month], from: self)
        ) ?? self
    }
        
    func startOfDayTime(using calendar: Calendar) -> Date {
        calendar.date(
            from: calendar.dateComponents([.hour, .minute], from: self)
        ) ?? self
    }
    
    func differenceInMonthsAndWeeks(to date: Date) -> (months: Int, weeks: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .weekOfMonth, .day], from: self, to: date)
        
        let totalMonths = components.month ?? 0 + (components.year ?? 0) * 12
        let weeks = components.weekOfMonth ?? 0
        
        return (totalMonths, weeks)
    }
}
    
private extension DateFormatter {
    convenience init(dateFormat: String, calendar: Calendar, locale: Locale) {
        self.init()
        self.dateFormat = dateFormat
        self.calendar = calendar
        self.locale = locale
    }
}
// MARK: - Previews

/*struct CalendarWeekView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainPage(calendar: Calendar(identifier: .gregorian))
        }
    }
}*/

