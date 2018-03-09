import Foundation

var teams = ["A's", "Angels", "Astros", "Giants", "Pirates", "Rangers", "Rockies", "Twins"]

var dateFormatter: DateFormatter {
    let df = DateFormatter()
    df.timeZone = TimeZone.autoupdatingCurrent
    return df
}

let timeFormat = "h:mma"
let dateFormat = "M/d/yyyy"
let dateTimeFormat = "\(dateFormat) \(timeFormat)"

class ExportableGame: CustomStringConvertible, Equatable {
    var description: String {
        let df = dateFormatter
        df.dateFormat = dateFormat
        let tf = dateFormatter
        tf.dateFormat = timeFormat
        var msg = "\(clubId),\(df.string(from: start)),\(tf.string(from: start).lowercased()),\(tf.string(from: finish).lowercased())"
        msg += ",\(team),\(facility),\(type),\(opponent),\(note),,,,\(databaseId),,"
        return msg
    }

    var team: String
    var opponent: String
    var databaseId: String
    var clubId = ""
    var start: Date
    var finish: Date
    var facility: String
    var type = "Game"
    var note = ""

    init(team: String,
         opponent: String,
         databaseId: String,
         start: Date,
         finish: Date,
         facility: String) {

        self.team = team
        self.opponent = opponent
        self.databaseId = databaseId
        self.start = start
        self.finish = finish
        self.facility = facility
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }

    func getDate() -> String {
        let df = dateFormatter
        df.timeZone = TimeZone.autoupdatingCurrent
        df.dateFormat = dateFormat
        return df.string(from: start)
    }

    private func convert(time date: Date) -> String {
        let df = dateFormatter
        df.dateFormat = timeFormat
        return df.string(from: date)
    }

    private func convert(date: String, time: String) -> Date {
        let df = dateFormatter
        df.timeZone = TimeZone.autoupdatingCurrent
        df.dateFormat = dateTimeFormat
        return df.date(from: "\(date) \(time)")!
    }

    func getStartTime() -> String {
        return convert(time: start)
    }

    func getFinishTime() -> String {
        return convert(time: finish)
    }

    //    swiftlint:disable function_parameter_count
    public static func builder(team: String,
                               opponent: String,
                               databaseId: String,
                               date: String,
                               start: String,
                               finish: String,
                               facility: String) -> ExportableGame {
        //    swiftlint:enable function_parameter_count

        let df = dateFormatter
        df.dateFormat = dateTimeFormat
        guard let realStart = df.date(from: "\(date) \(start)"),
            let realFinish = df.date(from: "\(date) \(finish)") else {
                print("Umm ... unable to convert ", date, start, finish, " into real dates for some reason")
                exit(10)
        }

        return ExportableGame(team: team, opponent: opponent, databaseId: databaseId, start: realStart, finish: realFinish, facility: facility)
    }

    static func == (lhs: ExportableGame, rhs: ExportableGame) -> Bool {
        return lhs.databaseId == rhs.databaseId
    }
}

l
