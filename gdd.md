### **Game Design Document: Brittle Brawl**

---

### **1. Overview**

- **Working Title:** Brittle Brawl
- **Genre:** Top-Down Arena Brawler / Arcade Hack 'n' Slash
- **Jam Theme:** Decay
- **The Pitch:** A frantic arena brawler where every weapon breaks after a few hits, forcing the player to constantly improvise using environmental objects to survive increasingly intense waves of enemies.
- **Core Idea:** The fun doesn't come from mastering a weapon, but from the fluidity of improvisation, the panic of being disarmed, and the satisfaction of turning chaos into an advantage.

---

### **2. Core Gameplay Loop**

The structure of every moment in the game follows this rapid and addictive cycle:

1.  **SPAWN:** The player appears. A wave of enemies arrives.
2.  **GRAB:** The player runs to the nearest object (a chair, a bottle, a frying pan) and instantly equips it.
3.  **FIGHT:** The player hits enemies, using up their weapon's limited durability.
4.  **BREAK:** The weapon shatters with a satisfying "CRACK!" **(This is "Decay"!)** The object disappears or produces a special effect.
5.  **PANIC & ADAPT:** The player is disarmed again. They must dodge, push, and scan the environment to find their next "weapon."
6.  **REPEAT:** The cycle begins again, creating a constant rhythm of tension and relief.

---

### **3. Systems & Gameplay Mechanics**

#### **3.1. Player Controls**

The player must be responsive and mobile. Controls must feel instantaneous.

- **Movement:** Standard 8-directional (WASD or Left Stick).
- **Attack:** A single button. The attack is a simple "swoosh" in front of the player.
- **Grab:** A single button. Instantaneous when near an object.
- **Dodge (Dash):** A quick roll or dash with a few _invincibility frames_ (i-frames) to allow for risky maneuvers. This is the #1 survival skill.
- **Push:** When the player is unarmed, the attack button performs a push that deals no damage but knocks back nearby enemies to create space.
- **Throw:** The player can throw their current weapon. A weapon with 1 durability remaining is perfect for a ranged finishing blow.

#### **3.2. The "Decay" System: The Improvised Arsenal**

Variety comes not from stats, but from the unique properties of each object. "Decay" is a strategic mechanic.

| Weapon            | Durability | On-Break Effect                                                        | Strategic Role                                 |
| :---------------- | :--------- | :--------------------------------------------------------------------- | :--------------------------------------------- |
| **Glass Bottle**  | 1 Hit      | **Explodes into shards:** Deals minor area-of-effect damage.           | Crowd control, finishing off groups.           |
| **Wooden Chair**  | 3 Hits     | **Leaves a "Chair Leg":** The player gets a new 1-hit weapon.          | 2-in-1 weapon, reliable.                       |
| **Cast Iron Pan** | 5 Hits     | **Stuns:** The final hit that breaks the pan stuns the enemy.          | Ideal for neutralizing a high-priority threat. |
| **Dead Fish**     | 2 Hits     | **Slippery Puddle:** Leaves a puddle that enemies slip on.             | Area denial, creating escape routes.           |
| **Oil Lantern**   | 2 Hits     | **Pool of Fire:** Creates a patch of fire that deals damage over time. | Zone control, passive damage.                  |

#### **3.3. The Enemy Bestiary**

Enemies are designed to force the player to adapt their strategy.

| Enemy            | Behavior                                     | Strategic Role                                                              |
| :--------------- | :------------------------------------------- | :-------------------------------------------------------------------------- |
| **The Zombie**   | Slow, predictable, follows the player. 3 HP. | Basic fodder, cannon fodder.                                                |
| **The Sprinter** | Very fast but fragile. 1 HP.                 | Harasser, forces the player to "waste" weapon hits.                         |
| **The Brute**    | Very slow, tough. 6 HP.                      | A "durability sink," forces the player to decide whether to fight or avoid. |

#### **3.4. Progression and End Condition**

- **Structure:** The game is based on a system of **10 waves**.
- **Win Condition:** Survive and defeat the 10th wave.
- **Lose Condition:** The player's health bar drops to zero.
- **Scoring:** The final score is the wave number reached. If the player wins, their score can be the total time taken.

---

### **4. Art Direction & Audio ("The Juice")**

- **Perspective:** **Top-Down** for maximum clarity and rapid prototyping.
- **Visual Style:** **Pixel Art.** The style should be clean and readable, with clear sprites and well-defined silhouettes. The most important thing is **visual feedback**.
  - **Hit-Flash:** Enemies flash white when struck.
  - **Screen Shake:** A slight camera shake on critical impacts and when weapons break.
  - **Particles:** Shards (wood, glass, metal) must burst from every breaking weapon.
- **Audio:** Audio is 50% of the game's feel. It must be punchy and satisfying.
  - **CRACK!:** A unique and powerful sound for each type of breaking weapon.
  - **THWACK!:** A heavy and satisfying impact sound.
  - **FWOOSH!:** A quick sound for picking up items.
  - **Music:** An intense, looping electronic or rock track to maintain high energy.

---

### **5. 7-Day Production Plan (MVP)**

- **Days 1-2: The "Proto-Cube" & Feel**
  - **Goal:** A character that can move, dash, grab, attack, and push.
  - **To-Do:** Player controller, grab mechanic, basic durability system (one object that breaks in 3 hits), unarmed push mechanic.

- **Days 3-4: Opposition & Structure**
  - **Goal:** A reason to fight and a beginning/end.
  - **To-Do:** **Zombie** and **Sprinter** AI. Wave Manager system. Player health and a "Game Over" screen.

- **Day 5: Strategic Chaos (Key Day)**
  - **Goal:** Inject variety and depth.
  - **To-Do:** Create 5-6 different weapon types with their unique durability and **"On-Break" effects**. Populate the arena with objects and obstacles.

- **Day 6: The "JUICE"**
  - **Goal:** Make the game feel sensorially satisfying.
  - **To-Do:** Integrate ALL sounds (break, hit, pickup), music, screen shake, hit-flashes, and particle effects.

- **Day 7: Polish & Shipping**
  - **Goal:** Package the game.
  - **To-Do:** Main Menu (Play, Leaderboard, Quit), Game Over screen (with score and name input), **implement the online leaderboard**, bug fixing, build, and publish.
