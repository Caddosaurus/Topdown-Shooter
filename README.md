
## Will's Cool Top-Down Shooter (made in Godot 4.2)!

Here is my summer passion project. I made this using a number of resources, including [Michael Games' **excellent** AARPG tutorial series](https://www.youtube.com/playlist?list=PLfcCiyd_V9GH8M9xd_QKlyU8jryGcy3Xa), [ArMM1998's Zelda-Like Tilesets and Sprites on OpenGameArt.org](https://opengameart.org/content/zelda-like-tilesets-and-sprites), and [Bonsaiheldin's slime monster tilesheet](https://opengameart.org/content/slime-monster-24x24).

That being said, I *did* do my own stuff here too - like some of the sprites (even that super-cool smoke texture) and while I used Michael Games' series as a starting point for the code, I made major changes to the code to better follow the object-oriented design I learned so much about this year in AP Computer Science. For example, I put most of the common code between the Enemy class and the Player class into the Entity class, and some states - like Stun and Destroy - are shared between Players and Enemies. The bullet code and pickup code is also broadly my own.

This game is mostly just a (very incomplete) demo of an extensible class-based system in Godot that I would like to keep working on this summer.
