module Map

class Room

  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end

  # these make it easy for you to access the variables
  attr_reader :name
  attr_reader :paths
  attr_reader :description

  def go(direction)
    return @paths[direction]
  end

  def add_paths(paths)
    @paths.update(paths)
  end

end

Intro1 = Room.new("Intro1",
"""
Welcome, today you will see what it is to be training as an athlete today...
If you would like to play press space (then click enter), or if you want to quit
type 'quit'
""")

Intro1.add_paths({
  " " => Name,
  "quit" => Intro2
})

Intro2 = Room.new("Intro2",
"""
Oh ok.... goodbye 

""")

Name1 = Room.new("Name1",
"""
Great, let's play!!
**Before you start playing, you must type the commands exactly how they are written.***
...
...


What is your name? (first name only)
""")

Name1.add_paths({
  $name = $stdin.gets.chomp => Breakfast
})

Breakfast = Room.new("Breakfast",
"""
#{$name}, you walk downstairs, it is six in the morning.
You can hear your mother reading the newspaper in the kitchen. You are very tired and can barely see. It is one of those mornings... 
You finally reach the kitchen table and sit down, and your mother looks at you for breakfast.


Mom: 'Hello #{$name}, how are you doing today?
#{$name}: Hi mom
Mom: Are you hungry?
#{$name}: (Yes or no)
""")

Breakfast.add_paths({
  "yes" => Hungry,
  "no" => Practice1
})

Hungry = Room.new("Room",
"""
Mom: Great, we have a ton of food this morning!!
You hear all of the different kinds of food your mother has to offer: Bacon and
eggs, waffles (with butter and syrup), fruit salad, and croissants
What would you like for breakfast? Type the food you want.
""")

Hungry.add_paths({
  "Bacon and eggs" => Practice2,
  "waffles" => Practice2,
  "fruit salad" => Practice1,
  "croissants" => Practice2
})

Practice1 = Room.new("Practice1",
"""
Narrator: 'You arrive at the cross country track. You have difficulty putting on your skies.
You try to musterup all of the strength you can to go to the old pine tree that is 50 ft tall.
You look up as it towers over you and notice there is a seat lying against it's base. 
You rush over making sure you are the only one there. Starting to lay your head back, your eyes start to shut. 
You are lucky because the other students will not annoy you because they cannot see that you are asleep due to the goggles covering your eyes. 
No one knows it yet, not even yourself, but you are in a food coma.
\t You suddenly feel somone shaking you, and your eyes suddenly open. It is the head of the racing programme. 
You look around and notice there is no one there, no annoying kids; no coaches; no annoying tourists... it was just you. 
You look down at your watch and you noticed it was 9:30, which is one hour after you were supposed to be on the hill.

\n \t You get up frantically, knowing that your coach will be pissed at you. You feel agitation in your stomach you do not feel that you should stop. \n You get up and start rushing around the track to find everyone. You are running and start shaking: the idea of angering your coach gets to you. \n You reach the start...

You start the 'Jesus walk' and thinking to yourself 'I am going to die today... Nice to know you world.' Your coach comes into view.

You start to feel adrenaline rushing through your veins. He begins to yell at you! \n He stops.

 Do you scream back or just carry on with your day?
 
 **For Scream write 'fight' and to continue your day write 'continue'**
""")
Practice2 = Room.new("Practice2",
"""
Narrator: 'You arrive at the cross country track. You have difficulty putting on your skies.
You try to musterup all of the strength you can to go to the old pine tree that is 50 ft tall.
You look up as it towers over you and notice there is a seat lying against it's base. 
You rush over making sure you are the only one there. Starting to lay your head back, your eyes start to shut. 
You are lucky because the other students will not annoy you because they cannot see that you are asleep due to the goggles covering your eyes. 
No one knows it yet, not even yourself, but you are in a food coma.
\t You suddenly feel somone shaking you, and your eyes suddenly open. It is the head of the racing programme. 
You look around and notice there is no one there, no annoying kids; no coaches; no annoying tourists... it was just you. 
You look down at your watch and you noticed it was 9:30, which is one hour after you were supposed to be on the hill.

\n \t You get up frantically, knowing that your coach will be pissed at you. You feel agitation in your stomach you do not feel that you should stop. \n You get up and start rushing around the track to find everyone. You are running and start shaking: the idea of angering your coach gets to you. \n You reach the start...

You start the 'Jesus walk' and thinking to yourself 'I am going to die today... Nice to know you world.' Your coach comes into view.

You start to feel adrenaline rushing through your veins. He begins to yell at you! \n He stops.

 Do you scream back or just carry on with your day?
 
 **For Scream write 'fight' and to continue your day write 'continue'**
""")


Practice1.add_paths({
  "continue" => Hike1,
  "fight" => Home1
})

Practice2.add_paths({
  "continue" => Hike2,
  "fight" => Home1
})


Home1 = Room.new("Home1",
"""
You begin to scream so much that your face turns red.
When you finish your coach looks irate.

Your Coach forces you to go home. Your mom sees you and asks what happened...
you tell her, and you are grounded.
You have lost the game.
Good Bye
""")

Hike1 = Room.new("Hike1",
"""
\tYou start hiking the air is thin, and it gets increasingly difficult as time goes on. Although you look forward \nto the time when you start: it is when you can have a bit of water on a hot summer day.

\tOn the third time going around your stomach begins to hurt. You do not know what it is, so you continue to climb, \nbut as time goes it starts to hurt much more. \nYou try to push because of the concept of 'NO PAIN NO GAIN...'

***

You cannot race tomorrow because your mother is afraid about your health. You miss the scouts, and you do not get recruited to Cornell.

""")

Hike2 = Room.new("Hike2",
"""
\tYou start hiking the air is thin, and it gets increasingly difficult as time goes on. Although you look forward \nto the time when you start: it is when you can have a bit of water on a hot summer day.

\tOn the third time going around your stomach begins to hurt. You do not know what it is, so you continue to climb, \nbut as time goes it starts to hurt much more. \nYou try to push because of the concept of 'NO PAIN NO GAIN...'

***

You push through the pain. Turns out it was just Indigestion.
You pushed yourself and ran around a few times.

You end up decreasing your time by 1.6 seconds, which is stellar. 
Now since you pushed yourself, you are projected to win the race tomorrow 
if you eat right and push yourself.

""")

START = Intro1

ROOM_NAMES = {
        'Intro1' => Intro1,
        'Intro2' => Intro2,
        'Name1' => Name1,
        'Breakfast' => Breakfast,
        'Hungry' => Hungry,
        'Practice1' => Practice1,
        'Practice2' => Practice2,
        'Home' => Home,
        'Home1' => Home1,
        'Hike1' => Hike1,
        'Hike2' => Hike2,
        'Start' => Start,
    }
    
    def Map::load_room(session)
        # Given a session this will return the right room or nil
        return ROOM_NAMES[session[:room]]
    end

    def Map::save_room(session, room)
        # Store the room in the session for later, using its name
        session[:room] = ROOM_NAMES.key(room)
    end
end
