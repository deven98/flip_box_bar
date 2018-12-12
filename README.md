# flip_box_bar

A 3D BottomNavigationBar inspired by Dribbble design by Dannniel
["https://dribbble.com/shots/4811135-Tab-Bar-Cube-Interaction].

# Demo

![]("https:www.github.com/deven98/flip_box_bar/demo.gif")

# Example Use


      // In Scaffold
      bottomNavigationBar: FlipBoxBar(
              items: [
                FlipBarItem(icon: Icon(Icons.map), text: Text("Map"), frontColor: Colors.blue, backColor: Colors.blueAccent),
                FlipBarItem(icon: Icon(Icons.add), text: Text("Add"), frontColor: Colors.cyan, backColor: Colors.cyanAccent),
                FlipBarItem(icon: Icon(Icons.chrome_reader_mode), text: Text("Read"), frontColor: Colors.orange, backColor: Colors.orangeAccent),
                FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.purple, backColor: Colors.purpleAccent),
                FlipBarItem(icon: Icon(Icons.print), text: Text("Print"), frontColor: Colors.pink, backColor: Colors.pinkAccent),
              ],
              onIndexChanged: (newIndex) {
                print(newIndex);
              },
            ),
