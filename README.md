<h1 align="center">  Knight Run </h1>

![](https://lh4.googleusercontent.com/ZAlPmN5IJa7XoWw7pKl3lJjhg1RIbqrnrHqmqakir-lgzkNail9VO93c3Dtt-uzFBdTbapqpzAf0seF7-Y7aP7wKGqXIw5j6OhIk2J3U_IiQpkH-FA3J1qJPooLDOjNwd3SbrQoQ)
![](https://lh4.googleusercontent.com/LeoB0ORqqv_pOt5qdynrybUGKZLw6yx7YsW98hTJrAn7KLS4rgUjp5bjid5dTeqF8GPURNs3bDNNYe18t6yaoiaFf1s5qEuxx8hslUMu_Um6D23W8kKtK1uYch70iOmRGO-eh-sl)

A challenge to myself to see if I can make a game on the Basys 3 with ~265kb of storage coding in Verilog.

> <font size = "5" >Controls
> ------
>|Input|Action  |
>|--|--|
>| BTNU  | Jump |
>|BTND | Vanish|
>|BTNC | Restart


 An ogre is chasing you! Dodge his attacks until you reach safety. You only have one life, a victory screen shows when the led timer runs out. Getting hit will show a defeat screen. The ogre, ground and the knight are all animated. The ogre has states, run/laser-eye/ground-attack while the player has run/jump/vanish. Randomly generated attack sequences to keep you on your toes. Each entity is a separate sprite animated independently. FSMs are used to control the logic of entities.

