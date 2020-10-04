extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const facts = ["More than 5,00,000 pieces of debris or space junk are tracked as they orbit the earth.",
    "A piece of space debris can reach speeds of 4.3 to 5 miles per second. That’s nearly 7 times faster than a bullet and just about the equivalent of being hit by a bowling ball moving at 300 miles per hour",
    "Space shuttle windows often had to be replaced because of damage from collisions with man-made debris smaller than 1 mm (0.04 inch).",
    "Satellites also can see into space better than telescopes at Earth's surface.",
    "The increasing amount of space debris orbiting the earth could lead to catastrophic collisions with the numerous billion dollar satellites in orbit and can affect the world economy.",
    "There are international guidelines from the Inter Agency Space Debris Coordination Committee (IADC) to prevent space debris and keep safe.",
    "The United Nations ask that all companies remove their satellites from orbit within 25 years after the end of their mission.",
    "NASA has a set of long-standing guidelines that are used to assess whether the threat of a close approach of orbital debris to a spacecraft is sufficient to warrant evasive action or precautions to ensure the safety of the crew.",
    "JAXA, Japan's space agency, is testing an electronic space whip that stretches six football fields long, known as the electrodynamic tether (EDT). The electrified line, nearly 2,300 feet long, is capped with a 44-pound weight. When deployed, it's intended to knock debris out of orbit, sending it to burn up in Earth's atmosphere",
    "In one year, the International Space Station had to coordinate three shifts in position to avoid disastrous collisions with space debris, a feat that requires days of effort.",
    "ISRO (Indian Space Research Organisation), being a part of the IADC, is involved in global mitigation measures which takes many forms including the prevention of new debris creation, designing satellites to withstand by the impact of small pieces of debris, improving operational procedures such as using orbital regimes with less debris, and predicting space debris collisions and avoiding them"
    ]
    
onready var i = 1
# Called when the node enters the scene tree for the first time.


func _ready():
    $".".set_text("Fact: " + facts[0])
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass



func _on_Timer_timeout():
    if i >= len(facts):
        i  = 0
    $".".set_text("Fact: " + facts[i])
    i += 1
