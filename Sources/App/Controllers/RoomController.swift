import Vapor

struct RoomController {
    func create(req: Request) throws -> QuizRoomRole {
        return QuizRoomRole.createMasterOfCeremony()
    }
    
    func join(req: Request) throws -> QuizRoomRole {
        switch(req.parameters.get("roomIdentifier")) {
        case .none:
            throw Abort(.notFound)
        case let .some(roomIdentifier):
            return QuizRoomRole.createPlayer(roomIdentifier: roomIdentifier)
        }
    }
}
