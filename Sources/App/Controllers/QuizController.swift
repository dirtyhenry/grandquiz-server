import Vapor
import NIO

class QuizController {
    let request: Request
    let webSocket: WebSocket
    
    init(request: Request, webSocket: WebSocket) {
        self.request = request
        self.webSocket = webSocket
        // TODO: how to close the websocket when no answer is received.
        webSocket.pingInterval = TimeAmount.seconds(10)
    }
    
    func start() {
        webSocket.send("In what year did John Lennon die?")
        
        webSocket.onText { ws, string in
            if string == "1980" {
                ws.send("🎉 Correct!")
            } else {
                ws.send("⛔️ Incorrect!")
            }
        }
        
        webSocket.onPing { ws in
            print("Ping was received.")
        }
        
        webSocket.onPong { ws in
            print("Pong was received.")
        }
    }
}
