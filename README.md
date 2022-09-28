# Bleach2D
#### Video Demo:  <URL HERE>
#### Description:
To celebrate the return of the [Bleach](https://en.wikipedia.org/wiki/Bleach_(TV_series)#Thousand-Year_Blood_War) anime, I will be creating a "shooting" game. The player will control Ichigo (the main character) and attempt to defeat the enemy (Uryu). The enemy will fire arrows at the player and if the player is hit by an arrow, they lose health. If the player loses all their health, the game is over. Conversely, the player can fire attacks at the enemy using the spacebar. Same rules apply. However, the enemy moves faster than the player and can attack more frequently too. To balance this, the player has an option to power up (Bankai) by pressing the "b" key. After powering up, the player's sprite looks different, fires a different looking attack, and its movement speed increases. Whoever runs out of health first loses the game. This game was created using Lua and the LOVE framework.

#### main.lua
##### love.load()
Defines global variables like window_width and window_height to be used in collision calculations later on. Also pulls in other .lua files and instantiates Player and Enemy objects.

##### love.update(dt)
Calls the update() method on the Player and Enemy objects so they can move. Also handles updating the player and enemy's attacks by looping through a table containing attack objects (Slash or Arrow) and calling the appropriate methods.

##### love.draw()
Calls the draw() method on the Player and Enemy objects so they can appear. Handles drawing the attacks too in the same way that love.update() did. Also monitors the player's and enemy's health. If either drops below a certain threshold, a message is printed to the screen and a global variable is set to true, indicating the game is over.

##### love.keypressed(key)
Listen for the user's key presses. If the user presses the "b" key, the player get powered up. The player object's image and speed attributes are updated to achieve this effect. If the game is over and the user presses the "q" key, the game restarts. If the player presses the spacebar, their sprite launches an attack.

#### classic.lua
Boilerplate code that's there so I can create classes.

#### character.lua
The superclass by which Player and Enemy classes inherit from. Its constructor sets the health attribute equal to 5. This class also has an update(dt) method that handles moving the character via arrow keys and preventing them from going past the bounds of the game window.

#### player.lua
Extends Character. Its constructor calls Character's constructor. Its constuctor initializes several attributes like x/y position, speed, and width/height. This class also has an attack(key) method where an attack object (Slash) is created and inserted into a table for processing in main.lua.

#### slash.lua
Takes a Player object and initializes several attributes like x,y position, speed, width/height, and even changes what image appears based on whether the Player object has powered up yet. Also has a checkCollision() method to detect whether the attack made contact with an enemy. If so, the enemy's health is decremented by a small amount.

#### enemy.lua
Extends Character. Its constructor calls Character's constructor. Its constructor initializes several attributes like x/y position, speed, and width/height. This class has a special update() method that overrides the one inherited from the Character class. The enemy's x and y coordinates will change depending on where a randomly generated number falls between 0 and 1. This update() method also prevents the enemy from moving offscreen. Also has an attack() method that fires an attack using the same random number generation principle. When firing an attack, an attack object (Arrow) is inserted into a table that's processed in main.lua.

#### arrow.lua
Initializes several attributes like x,y position, speed, width/height. Also has a checkCollision() method to detect whether the attack made contact with the player. If so, the player's health is decremented by a small amount.