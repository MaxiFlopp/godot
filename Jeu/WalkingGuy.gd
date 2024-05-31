extends AnimatedSprite2D

# Vitesse de déplacement du sprite
var vitesse_deplacement = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Déplacer le sprite vers la gauche
	self.position.x -= vitesse_deplacement * delta
