# User Guide

## Installation

1. Navigate to [Quantum-Defence releases](https://github.com/bharathcs/quantum-defence/releases) and download the release for your platform.
1. Unpack it with your inbuilt utilities and run the main app.

- If you encounter any issues regarding 'unidentified developer' or 'unsigned certificate' and you are on a MacOS - follow this [link](https://support.apple.com/en-sg/guide/mac-help/mh40616/mac)

## User Guide

### Menu

![Menu Screenshot](./assets/menu.png)

- Start playing right away: Play the basic level mode (other levels coming)
- Start a tutorial mode: explain the different mechanics and walk the user up to be able to play a basic game with tower defence and quantum concepts
- Settings: Music / FX / Miscellanious options (not yet ready)
- Credits: (not yet ready)

### Arena Elements

![Game Screenshot](./assets/arena.png)

- Enemies: Hostile actors that charge at their base (red / blue) to attack
- Path: Navigable surface for the enemy
- Base: Red and blue planets (More obvious markers for dimensions tbc) with health bar

![Enemy Navigation](./assets/enemy-navigation.png)

- Enemies instantly recalculate shortest valid path on spawning and on collisions.
- Enemies simulate real mob behaviour by staggering randomly if colliding with fellow enemy
- Special logic to render blue enemies 'invisible' to red enemies and vice versa to prevent collisions across dimensions

![Tower Sprites](./assets/tower-sprites.png)

- 6 Towers have been made in both blue and red modes each.
- All towers extend from the same class and attacks their enemies
- They have their own instance and set of attributes that can be upgraded with items

### Build

![Building Towers](./assets/arena-build.png)

- Select build mode by hitting '+'
- Colour selector allows user to switch between creating red or blue towers
- Click on your chosen tower and then place it on the map. (Using the green / red tile selector as a guide for valid placements)
- Tower is only built on valid tiles, and will begin attacking the available enemies of its colours

### Inspect

![Inspecting Towers](./assets/tower-inspector.png)

- Select inspect mode by hitting 'i'
- Choose towers to see a graphical visualisation of the current attributes of this tower
- At this point, quantum towers can be added in to change the probability of enemy states after hit. (Default is always 100% red or blue to indicate no change to enemy)

**H Gate**

![Impact of gate](./assets/h-gate.png)

**RY Gate**

![Impact of gate](./assets/ry-gate.png)

**X Gate**

![Impact of gate](./assets/x-gate.png)

### Tutorial Level (Not ready)

Currently this is very light and not ready at all for milestone 2.

1. Basic game idea (Mostly intuitive)
   - Enemies swarm behaviour, targetting base
   - Bases and Map
   - Aim of protecting bases
1. Tower Defence Mechanisms (With labelled directions)
   - Drop towers
   - Pick up items
   - Upgrade Towers
1. Quantum Items and strategy
   - Directions to try specific upgrades in specific places to try basic strategies
   - Labels and guides to focus on the probability bar