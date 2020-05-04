import Vapor

struct QuizRoomRole: Content {
    let role: QuizRole
    let roomIdentifier: String
    
    static func createMasterOfCeremony() -> QuizRoomRole {
        return QuizRoomRole(role: .masterOfCeremony, roomIdentifier: UUID().uuidString)
    }
}

enum QuizRole: String, Codable {
    case masterOfCeremony = "MASTER_OF_CEREMONY"
    case player = "PLAYER"
}
