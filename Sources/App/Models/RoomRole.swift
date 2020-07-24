import Vapor

struct QuizRoomRole: Content {
    let role: QuizRole
    let roomIdentifier: String
    
    static func createMasterOfCeremony() -> QuizRoomRole {
        return QuizRoomRole(role: .masterOfCeremony, roomIdentifier: UUID().uuidString)
    }
    
    static func createPlayer(roomIdentifier: String) -> QuizRoomRole {
        return QuizRoomRole(role: .player, roomIdentifier: roomIdentifier)
    }
}

enum QuizRole: String, Codable {
    case masterOfCeremony = "MASTER_OF_CEREMONY"
    case player = "PLAYER"
}
