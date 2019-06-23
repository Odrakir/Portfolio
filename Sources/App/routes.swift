import Vapor
import Leaf

struct Context: Codable {
    let years: String
    let projects: [Project]
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
        
    router.get { req -> Future<View> in
        
        let projects = [
            Project(name: "Toggl", subtitle: "Cross platform app", description: "Time tracking application developed in Xamarin and C# for both Android and iOS. I mainly worked in the iOS and common parts of the codebase.", link: "https://github.com/toggl/mobileapp"),
            Project(name: "Superday", subtitle: "iPhone app", description: "Superday tracks your daily activities automatically by analyzing and learning from data from your Phone's movement and location.", link: "https://superday.toggl.com"),
            Project(name: "Contigo", subtitle: "iPad app", description: "This is a video magazine app targeted to women with breast cancer. It can be used eihter horizontally, where you can see videos of other women telling their experiences, or vertically as a magazine. It mixes videos with HTML 5 animations", link: "http://appcontigo.org/"),
            Project(name: "Tres", subtitle: "iPad app", description: "This was my very first app. I developed it in order to lear iOS development, and it still is a piece of work I'm proud of. It uses OpenGL to render a mesh of triangles with the colors of the image underneath.", link: "https://www.youtube.com/watch?v=DFwHEUu7Ba0"),
            Project(name: "The Circle of Health", subtitle: "iPad and iPhone app", description: "This is an app done to promote cardiovascular health. I designed the UX and developed the whole UI. It includes some informational sections together with some tracking tools to help the users improve their cardiovascular health.", link: "https://www.youtube.com/watch?v=qPNmEhpBmaw"),
            Project(name: "n by Jorge Drexler", subtitle: "Flash prototypes for iOS and Android apps", description: "Three interactive songs by the Uruguayan oscar winner singer-songwriter Jorge Drexler. My task was to work with Drexler to come up with the UX and develop prototypes for all the songs for the iOS and Android teams to base their work on.", link: "https://www.youtube.com/watch?v=PycgYziA5uM&list"),
            Project(name: "Dermomedia", subtitle: "iPad and iPhone app", description: "This app is targeted to medicine students who want to reinforce their knowledge of dermatological pathologies as well as helping doctor identify and track pathologies", link: "https://vimeo.com/156386805"),
            Project(name: "Sincrolab", subtitle: "iPad prototypes", description: "Three games for kids with learning disabilities developed using Sprite Kit. It also features a tutor login where the tutor can track the kids' progress and taylor the game to their needs.", link: "https://www.sincrolab.es")
        ]
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        
        let context = Context(
            years: String(year - 2011),
            projects: projects
        )
        
        return try req.view().render("main", ["context": context])
    }

    /*
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
     */
}
