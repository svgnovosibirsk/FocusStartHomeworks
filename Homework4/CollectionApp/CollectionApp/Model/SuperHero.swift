//
//  SuperHero.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import Foundation

struct SuperHero {
    let name: String
    let image: String
    let description: String
    let history: String
}

extension SuperHero {

    static func createSuperHeroArray() -> [SuperHero] {

        let hero0 = SuperHero(name: "ANT MAN",
                              image: "000",
                              description: """
Ex-con Scott Lang uses high-tech equipment to shrink down to
insect-size and fight injustice as Ant-Man.
""",
                              history: """
Overcoming his criminal past, Scott Lang follows in the tiny, yet mighty,
footsteps of his predecessor as the size-changing hero known as Ant-Man!
""")
        let hero1 = SuperHero(name: "WINTER SOLDIER",
                              image: "001",
                              description: """
James Buchanan “Bucky” Barnes enlists to fight in World War II,
but eventually literally falls in battle.
Unfortunately, the evil Arnim Zola recovers him and erases his memory,
turning him into a highly-trained assassin called the Winter Soldier.
""",
                              history: """
A brave soldier, Barnes fights valiantly, but eventually literally
falls in battle. Unfortunately, it is the evil Arnim Zola
who recovers him, erases his memory and turns him into a highly-trained,
but mindless assassin called the Winter Soldier.
""")
        let hero2 = SuperHero(name: "BLACK WIDOW",
                              image: "002",
                              description: """
A deadly assassin is closing in on Natasha Romanoff.
Now Natasha must reunite with an unlikely group of spies
from her past in order to survive and stop a lethal force
from being unleashed on the world.
""",
                              history: """
A deadly assassin is closing in on Natasha Romanoff.
Now Natasha must reunite with an unlikely group of spies
from her past in order to survive and stop a lethal force
from being unleashed on the world.
""")
        let hero3 = SuperHero(name: "LOKI",
                              image: "003",
                              description: """
Loki, Prince of Asgard, Odinson, rightful heir of Jotunheim, and God of Mischief,
is burdened with glorious purpose. His desire to be a king drives him
to sow chaos in Asgard. In his lust for power, he extends his reach to Earth
""",
                              history: """
Loki, Prince of Asgard, Odinson, rightful heir of Jotunheim, and God of Mischief,
is burdened with glorious purpose. His desire to be a king drives him to sow chaos in Asgard.
In his lust for power, he extends his reach to Earth where he believes they need a
ruler and encounters unlikely heroes that interfere with his schemes.
""")
        let hero4 = SuperHero(name: "VISION",
                              image: "004",
                              description: """
A fully unique being, Vision came about thanks to a combination of
Wakandan Vibranium, Asgardian lightning, an Infinity Stone, and more
""",
                              history: """
Upon gaining sentience, Vision offered to help fight Ultron.
Since then, he has been doing his best to understand and control the
Mind Stone in his forehead and prove himself as an Avenger,
all while learning what it means to be human.
""")
        let hero5 = SuperHero(name: "WANDA",
                              image: "005",
                              description: """
Notably powerful, Wanda Maximoff has fought both against and with the Avengers,
attempting to hone her abilities and do what she believes is right to help the world.
""",
                              history: """
Wanda Maximoff aimed her anger and grief over loss of her parents at Tony Stark,
which drove her to HYDRA—where she gained powers—which drove her further to Ultron,
where she gained perspective. Seeing the error of her ways, Wanda switched sides.
""")
        let hero6 = SuperHero(name: "CAPTAIN AMERICA",
                              image: "006",
                              description: """
America’s World War II Super-Soldier continues his fight
in the present as an Avenger and untiring sentinel of liberty.
""",
                              history: """
Envious of his friend Bucky Barnes’ military enlistment, and undeterred
by his own multiple rejections by the U.S. Army, physical weakling Steve Rogers
made one more attempt to join the march of men to fight for their country in the
dark days of World War II.
""")
        let hero7 = SuperHero(name: "IRON MAN",
                              image: "007",
                              description: """
Inventor Tony Stark applies his genius for high-tech solutions
to problems as Iron Man, the armored Avenger.
""",
                              history: """
Genius inventor Tony Stark continued his father Howard Stark’s weaponry business
after his parents’ untimely deaths and flew it to even greater heights of innovation.
While in Afghanistan to demonstrate a new missile for the U.S. military,
Stark’s convoy came under fire by a terrorist group known as the Ten Rings and he was severely wounded
""")
        let hero8 = SuperHero(name: "SPIDER MAN",
                              image: "008",
                              description: """
With amazing spider-like abilities, teenage science whiz Peter Parker
fights crime and dreams of becoming an Avenger as Spider-Man.
""",
                              history: """
A bite from a spider somehow granted teenager Peter Parker its arachnid abilities
and instead of using them for personal gain, he decided to help others with them.
An orphan living with his aunt, May Parker, the boy chose to wear a mask while
fighting crime so as not to burden her with his actions.
""")
        let hero9 = SuperHero(name: "DOCTOR STRANGE",
                              image: "009",
                              description: """
Once a highly successful, yet notably egotistical, surgeon,
Doctor Stephen Strange endured a terrible accident that led him to
evolve in ways he could have never foreseen.
""",
                              history: """
Possessing vast magical knowledge and skills to call upon,
he now serves as Earth’s newest Master of the Mystic Arts.
""")

        return [hero0, hero1, hero2,hero3, hero4, hero5, hero6, hero7, hero8, hero9]
    }
}
