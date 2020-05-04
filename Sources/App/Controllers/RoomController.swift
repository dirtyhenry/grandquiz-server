import Vapor

struct RoomController {
    func create(req: Request) throws -> QuizRoomRole {
        return QuizRoomRole.createMasterOfCeremony()
    }
}
