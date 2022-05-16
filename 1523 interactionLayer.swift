import Scenes
import Igis

  /* 
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler
{   
    let ball = Ball()
    let paddleLeft = Paddle(rect:Rect(size:Size(width:10, height:100)))
    let paddleRight = Paddle(rect:Rect(size:Size(width:10, height:100)))

    //var change: Int
    init()
    {   
        //change = 0
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          insert(entity: ball, at: .front)
          ball.changeVelocity(velocityX: 3, velocityY: 3)
      
          // We insert our RenderableEntities in the constructor
          insert(entity: paddleLeft, at: .front)
          insert(entity: paddleRight, at: .front)
    }

    override func preSetup(canvasSize: Size, canvas: Canvas)
    {   
        paddleLeft.move(to:Point(x: 100, y: 480))
        paddleRight.move(to:Point(x: 1000, y: canvasSize.center.y))
        //paddleRight y = 1850
        dispatcher.registerKeyDownHandler(handler: self)

        /*
        // First, move to the new position
        //paddleLeft.center += Point(x:velocityX, y:velocityY)
        if let canvasSize = canvas.canvasSize
        {   
            // Form a bounding rectangle around the canvas
            let canvasBoundingRect = Rect(size:canvasSize)
            // Form a bounding rect around the ball (ellipse)
            let paddleLeftBoundingRect = Rect(topLeft:Point(x:paddleLeft.topLeft.x, y:paddleLeft.topLeft.y), size:Size(width:paddleLeft.size.width, height:paddleLeft.size.height))
            paddleLeft.move(to:Point(x: 100, y: paddleLeftBoundingRect.topLeft.y-change))
        }
         */
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool)
    {   
        print(key)
        let tlpl = paddleLeft.rectangle.rect.topLeft
        let tlpr = paddleRight.rectangle.rect.topLeft
        switch key
        {
        case "w":
            paddleLeft.move(to:Point(x: tlpl.x, y:tlpl.y - 10))
        case "s":
            paddleLeft.move(to:Point(x: tlpl.x, y:tlpl.y + 10))
        case "ArrowUp":
            paddleRight.move(to:Point(x: tlpr.x, y:tlpr.y - 10))
        case "ArrowDown":
            paddleRight.move(to:Point(x: tlpr.x, y:tlpr.y + 10))
        default:
            break
        }

        /*
        change = 0
        print(change)
        if key == "w"
        {   
            print("wow")
            change = 5
            print(change)
        }
         */
    }

    override func postTeardown()
    {   
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
}
