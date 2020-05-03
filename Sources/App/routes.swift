import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    // We need to keep a reference of the websocket somewhere otherwise it will create
    // an error if the websocket get deinitialized before being closed.
    var quizControllers: [QuizController] = []
    app.webSocket("quiz") { req, ws in
        let quizController = QuizController(request: req, webSocket: ws)
        quizControllers.append(quizController)
        quizController.start()
        print("Number of players: \(quizControllers.count)")
    }
}
