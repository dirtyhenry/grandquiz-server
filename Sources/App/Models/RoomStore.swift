import Foundation

class RoomStore {
    var rooms: [UUID: Room] = [:]
    
    func room() -> Room {
        let res = Room()
        rooms[res.uuid] = res
        return res
    }
}

class Room {
    let uuid: UUID
    
    init() {
        self.uuid = UUID()
    }
}
