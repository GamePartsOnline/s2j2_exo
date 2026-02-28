# s2j2_exo

A Ruby mini-game project demonstrating **Object-Oriented Programming (OOP)**. It is a terminal-based survival game: you play as a warrior facing waves of enemies.

## Project structure

```
s2j2_exo/
├── README.md
└── mini_jeu_POO/
    ├── app.rb       # Demo: 1v1 fight (two AI players)
    ├── app_2.rb     # Human vs 2 fixed enemies with menu
    ├── app_3.rb     # Full game: human vs 10 enemies (recommended)
    ├── Gemfile
    ├── Gemfile.lock
    └── lib/
        ├── game.rb   # Game logic and main loop
        └── player.rb # Player, HumanPlayer classes
```

## Requirements

- **Ruby** (2.x or 3.x)
- **Bundler** (`gem install bundler`)

## Setup

```bash
cd mini_jeu_POO
bundle install
```

## How to run

### Full game (recommended)

```bash
cd mini_jeu_POO
ruby app_3.rb
```

You face 10 enemies that appear over time. Each turn you can:

- **a** – Search for a better weapon (random level 1–6)
- **s** – Search for a health pack (+50 or +80 HP, capped at 100)
- **0**, **1**, … – Attack an enemy in sight (by index)

Enemies attack you after your turn. The game ends when you die or all 10 enemies are defeated.

### Other entry points

- **`ruby app.rb`** – Simple 1v1 fight (Josiane vs José), no human input.
- **`ruby app_2.rb`** – Human vs two fixed enemies (Josiane & José) with the same menu as above.

## OOP concepts used

- **Classes**: `Player`, `HumanPlayer`, `Game`
- **Inheritance**: `HumanPlayer` extends `Player`
- **Encapsulation**: attributes (`life_points`, `weapon_level`, etc.) and methods for state and actions
- **Composition**: `Game` holds a `HumanPlayer` and a list of enemy `Player` instances

## License

This project is for educational purposes (s2j2 exercise).
