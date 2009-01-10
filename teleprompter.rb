Shoes.app(:title=>"Teleprompter") do
def fontpicker size
  [:inscription,:para,:caption,:tagline,:subtitle,:title,:banner][size.to_i-1]
end
  filename= ask_open_file
  text=File.read(filename)
  stack(:width=>150) do
    para("How fast 1 - 60")
    @speed_box=edit_line("30")
    para("How big 1 - 7")
    @size_box=edit_line("5")
    i=400
    button("start #{filename}"){
      speed=@speed_box.text
      size=fontpicker(@size_box.text)
      animate(speed.to_i) do
        clear do
         a= send(size,text)
         a.move(0,i=i-1)
        end 
      end
    }
  end
end
