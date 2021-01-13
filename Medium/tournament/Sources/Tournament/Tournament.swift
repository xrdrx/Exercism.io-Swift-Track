//Solution goes in Sources
import Foundation

struct Tournament {
    private static let template = "Team                           | MP |  W |  D |  L |  P"
    
    private var teamList: [String: Team] = [:]
    
    mutating func tally(_ input: String) -> String {
        fillTeamList(input)
        return getFormattedTeamList()
    }
    
    private mutating func fillTeamList(_ input: String) {
        let output = input
            .split(separator: "\n")
            .map { $0.split(separator: ";") }
            .map { (teamOne: String($0[0]), teamTwo: String($0[1]), result: String($0[2])) }

        for result in output {
            var firstTeam = teamList[result.teamOne] ?? Team(name: result.teamOne)
            let firstTeamResult = MatchResult(rawValue: result.result)!
            
            var secondTeam = teamList[result.teamTwo] ?? Team(name: result.teamTwo)
            let secondTeamResult = firstTeamResult.opposite
            
            firstTeam.addGameResult(firstTeamResult)
            secondTeam.addGameResult(secondTeamResult)
            
            teamList[result.teamOne] = firstTeam
            teamList[result.teamTwo] = secondTeam
        }
    }
    
    private func getFormattedTeamList() -> String {
        var output = [Tournament.template]
        teamList.values.sorted(by: >).forEach { output.append(teamStatsToString(team: $0)) }
        return output.joined(separator: "\n")
    }
    
    private func teamStatsToString(team: Team) -> String {
        var output = Tournament.template
        output.replaceSubrange(team.name.startIndex..<team.name.endIndex, with: team.name)
        return output
            .replacingOccurrences(of: "| MP |", with: "|  \(team.played) |")
            .replacingOccurrences(of: "|  W |", with: "|  \(team.won) |")
            .replacingOccurrences(of: "|  D |", with: "|  \(team.draws) |")
            .replacingOccurrences(of: "|  L |", with: "|  \(team.lost) |")
            .replacingOccurrences(of: "|  P", with: "|  \(team.points)")
    }
}

enum MatchResult: String, Hashable {
    case win = "win"
    case loss = "loss"
    case draw = "draw"
    
    var opposite: MatchResult {
        switch self {
        case .win:
            return .loss
        case .draw:
            return .draw
        case .loss:
            return .win
        }
    }
}

struct Team: Hashable, Equatable, Comparable {
    let name: String
    var played: Int = 0
    var won: Int = 0
    var draws: Int = 0
    var lost: Int = 0
    var points: Int {
        won * 3 + draws
    }
    
    mutating func addGameResult(_ results: MatchResult) {
        played += 1
        switch results {
        case .win:
            won += 1
        case .loss:
            lost += 1
        case .draw:
            draws += 1
        }
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func < (lhs: Team, rhs: Team) -> Bool {
        if lhs.points != rhs.points {
            return lhs.points < rhs.points
        }
        return lhs.name > rhs.name
    }
}

