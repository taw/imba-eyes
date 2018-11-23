tag Eye < svg:g
  prop x
  prop y
  prop mx
  prop my

  def setup
    @x = x + Math.random() * 100 - 50
    @y = y + Math.random() * 100 - 50
    @sz = 30 + Math.random() * 40
    @color = "hsl({Math.random() * 360}, 100%, 50%)"
    console.log(x, y)

  def max_eye_movement
    0.3 * @sz

  def render
    let rx = @x
    let ry = @y
    if mx != null && my != null
      let dx = mx - @x
      let dy = my - @y
      let dl = Math.sqrt(dx*dx + dy*dy)
      if dl > max_eye_movement
        dx = max_eye_movement * dx/dl
        dy = max_eye_movement * dy/dl
      rx += dx
      ry += dy
    <self>
      <svg:circle.eye1 cx=(@x) cy=(@y) r=(@sz)>
      <svg:circle.eye2 cx=(rx) cy=(ry) r=(@sz*0.5) css:fill=@color>
      <svg:circle.eye3 cx=(rx) cy=(ry) r=(@sz*0.2)>

tag App
  def mount
    @mx = null
    @my = null
    schedule(raf: true)

  def onmousemove(event)
    let native_event = event:_event
    let svg = document.getElementById("eyes")
    let rect = svg.getBoundingClientRect()
    @mx = native_event:pageX - rect:x
    @my = native_event:pageY - rect:y

  def render
    <self>
      <header>
        "Eyes"
      <svg:svg#eyes>
        <Eye x=100 y=100 mx=@mx my=@my>
        <Eye x=100 y=300 mx=@mx my=@my>
        <Eye x=100 y=500 mx=@mx my=@my>
        <Eye x=300 y=100 mx=@mx my=@my>
        <Eye x=300 y=300 mx=@mx my=@my>
        <Eye x=300 y=500 mx=@mx my=@my>
        <Eye x=500 y=100 mx=@mx my=@my>
        <Eye x=500 y=300 mx=@mx my=@my>
        <Eye x=500 y=500 mx=@mx my=@my>


Imba.mount <App>
