import Foundation
import Igis
import Scenes

class Paddle: RenderableEntity
{   
    /*
    let paddleLeft = Paddle(rect:Rect(size:Size(width:10, height:100)))
    let paddleRight = Paddle(rect:Rect(size:Size(width:10, height:100)))
     */

    var rectangle: Rectangle

    /*
    var change: Int
     */
    var didRender: Bool

    init(rect:Rect)
    {   
        /*
        change = 0
         */
        didRender = false

        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Paddle")
    }

    /*
    override func setup(canvasSize: Size, canvas: Canvas)
    {   
        paddleLeft.move(to:Point(x: 100, y: canvasSize.center.y))
        paddleRight.move(to:Point(x: 1000, y: canvasSize.center.y))
        dispatcher.registerKeyDownHandler(handler: self)
    }
    override func teardown()
    {   
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool)
    {   
        change = 0
        print(change)
        if key == "w"
        {   
            print("wow")
            change = 5
            print(change)
            /*
            // First, move to the new position
            paddleLeft.center = Point(x:velocityX, y:velocityY)
            // Form a bounding rectangle around the canvas
            let canvasBoundingRect = Rect(size:canvasSize)
            // Form a bounding rect around the ball (ellipse)
            let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY), size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))
             */
            paddleLeft.move(to:Point(x: 100, y: 100-change))
        }
    }
     */

    override func render(canvas:Canvas)
    {   
        if let canvasSize = canvas.canvasSize
        {   
            // Clear the entire canvas
            let clearRect = Rect(topRight:Point(x:0, y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.fill)

            canvas.render(FillStyle(color:Color(.white)),clearRectangle)

            let strokeStyle = StrokeStyle(color:Color(.black))
            let fillStyle = FillStyle(color:Color(.white))
            let lineWidth = LineWidth(width:2)
            canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
            // First, move to the new position
            //paddleLeft.center += Point(x:velocityX, y:velocityY)
            /*
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
    }

    func move(to point:Point)
    {   
        rectangle.rect.topLeft = point
    }
}
