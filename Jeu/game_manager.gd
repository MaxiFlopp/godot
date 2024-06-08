extends Node

class_name GameManager



#Création du debug
@onready var debug = $Player/Camera2D/Labels/Debug
@onready var player = $Player

#J'appelle les variables
var MidDoorOpen = 0
var OnMidDoor = 0
var OnGurl = 0
var CurrentLvl = 0
var rng = RandomNumberGenerator.new()
var Anomaly = false
var OnExitDoorL = false
var OnExitDoorR = false
var rngbis = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()
var MidDoorE5 = 0
var MidDoorD6 = 0
var OnPan = 0


#Fonction qui affiche le debug
#func _input1(event):
	#if event is InputEventKey and event.is_pressed():
		#debug.text = event.as_text()

#RRRRRRRRRRRRRRRREEEEEEEEEEEEEEAAAAAAAAAAAAAAAAAAADDDDDDDDDDDDDDDDDDDDDYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
func _ready():
	#Tout les labels sont off
	$Player/Camera2D/Labels/DoorPressButton.visible = false
	$Player/Camera2D/Labels/ColorRect.visible = false
	$Player/Camera2D/Labels/TalkButton.visible = false
	$Player/Camera2D/Labels/InteractButton.visible = false
	$Player/Camera2D/Labels/GurlChat.visible = false
	$SprayTag.visible = false
	$Fissure.visible = false
	$Player/Camera2D/Labels/PanChat.visible = false
	var playerspeed = player.speed
	
	player.speed = 900.0
	
	#Y'a t'il une anomalie
	rng.randomize() # Seed le générateur de nombres aléatoires
	if rng.randf() < 0.5:
		print("Y'a une Anomalie")
		Anomaly = true
		anomaly_choice()
	else:
		print("Y'a pas d'anomalie")
		Anomaly = false



#PPPPPPPPPPPPPPRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCEEEEEEEEEEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
func _process(delta):
	
	#Condition ouverture porte milieu
	if Input.is_action_just_pressed("interact") and MidDoorOpen == 0 and OnMidDoor == 1:
		if MidDoorE5 == 1:
			$MidDoor.play("Night")
		if MidDoorD6 == 1:
			$MidDoor.play("open1")
		else:
			$MidDoor.play("Open")
			MidDoorOpen = 1
			print("interact pressed")
			$Player/Camera2D/Labels/InteractButton.visible = false
			$Player/Camera2D/Labels/ColorRect.visible = false
		
		
		
	#Condition Chat avec la fille
	if Input.is_action_just_pressed("interact") and OnGurl == 1:
		$Player/Camera2D/Labels/GurlChat.visible = true
		$Player/Camera2D/Labels/TalkButton.visible = false
		
		
	#interaction avec panneau
	if Input.is_action_just_pressed("interact") and OnPan == 1:
		$Player/Camera2D/Labels/PanChat.visible = true
		$Player/Camera2D/Labels/InteractButton.visible = false
		pass
		
		
	#Condition pour entrer dans la porte de gauche
	if Input.is_action_just_pressed("interact") and OnExitDoorL == true:
		$WaterPaint.play("Normal")
		$LittleDoor.play("Normal")
		$NaturePaint.play("Normal")
		$WalkingGuy.position = Vector2(4448, 832)
		$WalkingGuy.vitesse_deplacement = 100
		$MidDoor.play("Closed")
		$StandingGurl.play("default")
		$Statue1.play("default")
		$Statue2.play("default")
		$SprayTag.visible = false
		MidDoorE5 = 0
		MidDoorD6 = 0
		MidDoorOpen = 0
		OnMidDoor = 0
		$Fissure.visible = false
		$Pillars.play("default")
		$Pillars2.play("default")
		$Statue1.position = Vector2(2560, 704)
		$Statue2.position = Vector2(3840, 704)
		$BlinkingPaint.play("Blinking")
		$LittleDoor.position = Vector2(6528, 864)
		$CurrentLvl.scale = Vector2(6, 6)
		$WaterPaint.position = Vector2(1952, 672)
		$NaturePaint.position = Vector2(1633, 480)
		$BottlePaint.position = Vector2(1247.5, 576.5)
		$SittenGuy.position = Vector2(7264, 864)
		$Cam5.position = Vector2(2106, 224)
		$Cam2.position = Vector2(3709, 218)
		$Cam3.position = Vector2(6244, 208)
		$KidPaint.play("default")
		$SittenGuy.play("default")
		$BottlePaint.play("default")
		$Light3.play("default")
		$Bench.play("default")
		$BigPaint.play("default")
		$LittleDoor.scale = Vector2(4, 4)
		player.speed = 900.0
		#player.position = Vector2(291, 832)
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		if Anomaly == true:
			CurrentLvl +=1
			player.position = Vector2(291, 832)
			print(CurrentLvl)
			#Y'a t'il une anomalie
			rng.randomize() # Seed le générateur de nombres aléatoires
			if rng.randf() < 0.5:
				print("Y'a une Anomalie")
				Anomaly = true
				anomaly_choice()
			else:
				print("Y'a pas d'anomalie")
				Anomaly = false
		else:
			CurrentLvl = 0
			player.position = Vector2(291, 832)
			print(CurrentLvl)
			#Y'a t'il une anomalie
			rng.randomize() # Seed le générateur de nombres aléatoires
			if rng.randf() < 0.5:
				print("Y'a une Anomalie")
				Anomaly = true
				anomaly_choice()
			else:
				print("Y'a pas d'anomalie")
				Anomaly = false
		
		
	#Condition pour entrer dans la porte de droite
	if Input.is_action_just_pressed("interact") and OnExitDoorR == true:
		print("trying to open right door")
		$WaterPaint.play("Normal")
		$LittleDoor.play("Normal")
		$NaturePaint.play("Normal")
		$WalkingGuy.position = Vector2(4448, 832)
		$WalkingGuy.vitesse_deplacement = 100
		$MidDoor.play("Closed")
		$StandingGurl.play("default")
		$Statue1.play("default")
		$Statue2.play("default")
		MidDoorE5 = 0
		MidDoorD6 = 0
		MidDoorOpen = 0
		OnMidDoor = 0
		$SprayTag.visible = false
		$Fissure.visible = false
		$Pillars.play("default")
		$Pillars2.play("default")
		$Statue1.position = Vector2(2560, 704)
		$Statue2.position = Vector2(3840, 704)
		$BlinkingPaint.play("Blinking")
		$LittleDoor.position = Vector2(6528, 864)
		$CurrentLvl.scale = Vector2(6, 6)
		$WaterPaint.position = Vector2(1952, 672)
		$NaturePaint.position = Vector2(1633, 480)
		$BottlePaint.position = Vector2(1247.5, 576.5)
		$SittenGuy.position = Vector2(7264, 864)
		$Cam5.position = Vector2(2106, 224)
		$Cam2.position = Vector2(3709, 218)
		$Cam3.position = Vector2(6244, 208)
		$KidPaint.play("default")
		$SittenGuy.play("default")
		$BottlePaint.play("default")
		$Light3.play("default")
		$Bench.play("default")
		$BigPaint.play("default")
		$LittleDoor.scale = Vector2(4, 4)
		player.speed = 900.0
		#player.position = Vector2(291, 832)
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		if Anomaly == false:
			CurrentLvl += 1
			player.position = Vector2(291, 832)
			print(CurrentLvl)
			#Y'a t'il une anomalie
			rng.randomize() # Seed le générateur de nombres aléatoires
			if rng.randf() < 0.5:
				print("Y'a une Anomalie")
				Anomaly = true
				anomaly_choice()
			else:
				print("Y'a pas d'anomalie")
				Anomaly = false
		else:
			CurrentLvl = 0
			player.position = Vector2(291, 832)
			print(CurrentLvl)
			#Y'a t'il une anomalie
			rng.randomize() # Seed le générateur de nombres aléatoires
			if rng.randf() < 0.5:
				print("Y'a une Anomalie")
				Anomaly = true
				anomaly_choice()
			else:
				print("Y'a pas d'anomalie")
				Anomaly = false
				
				
			
	#Signboard Lvl
	if CurrentLvl == 0:
		$CurrentLvl.play("lvl 0")
	if CurrentLvl == 1:
		$CurrentLvl.play("lvl 1")
	if CurrentLvl == 2:
		$CurrentLvl.play("lvl 2")
	if CurrentLvl == 3:
		$CurrentLvl.play("lvl 3")
	if CurrentLvl == 4:
		$CurrentLvl.play("lvl 4")
	if CurrentLvl == 5:
		$CurrentLvl.play("lvl 5")
	if CurrentLvl == 6:
		$CurrentLvl.play("lvl 6")
	if CurrentLvl == 7:
		$CurrentLvl.play("lvl 7")
	if CurrentLvl == 8:
		$CurrentLvl.play("Exit")
		
		




#FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFOOOOOOOOOOOOOOOOOOOONNNNNNNNNNNNNNNNNNNNNNNNNCCCCCCCCCCCCCCCCCCCCTTTTTTTTTTTTTTTTTTTTTIIIIIIIIIIIIIIIIIIIIOOOOOOOOOOOOOOOOOOOOOONNNNNNNNNNNNNNNSSSSSSSSSSSSSS
 #Fonction pour la porte de gauche (entrée)
func _on_DoorL_area_2d_body_entered(body):
	print(body == $Player)
	$Player/Camera2D/Labels/DoorPressButton.visible = true
	$Player/Camera2D/Labels/ColorRect.visible = true
	$Player/Camera2D/Labels/InteractButton.visible = false
	$SecurisedDoorL.play("Opening")
	$SecurisedDoorR.play("Opening")
	OnMidDoor = 0
	OnExitDoorL = true
	OnExitDoorR = false

#Fonction pour la porte de gauche (sortie)
func _on_DoorL_area_2d_body_exited(body):
	pass # Replace with function body.
	$Player/Camera2D/Labels/DoorPressButton.visible = false
	$Player/Camera2D/Labels/ColorRect.visible = false
	$SecurisedDoorL.play("Closing")
	$SecurisedDoorR.play("Closing")
	OnExitDoorL = false


#Fonction pour la porte de droite (entrée)
func _on_DoorR_area_2d_body_entered(body):
	print(body == $Player)
	$Player/Camera2D/Labels/DoorPressButton.visible = true
	$Player/Camera2D/Labels/ColorRect.visible = true
	$Player/Camera2D/Labels/InteractButton.visible = false
	$SecurisedDoorL.play("Opening")
	$SecurisedDoorR.play("Opening")
	OnMidDoor = 0
	OnExitDoorR = true
	
#Fonction pour la porte de droite (sortie)
func _on_DoorR_area_2d_body_exited(body):
	$Player/Camera2D/Labels/DoorPressButton.visible = false
	$Player/Camera2D/Labels/ColorRect.visible = false
	$SecurisedDoorL.play("Closing")
	$SecurisedDoorR.play("Closing")
	OnExitDoorR = false
	
	
	#Intéraction avec Standing Gurl (entrée)
func _on_gurl_area_2d_body_entered(body):
	$Player/Camera2D/Labels/TalkButton.visible = true
	$Player/Camera2D/Labels/ColorRect.visible = true
	OnGurl = 1
	
	#Intéraction avec Standing Gurl (sortie)
func _on_gurl_area_2d_body_exited(body):
	$Player/Camera2D/Labels/TalkButton.visible = false
	$Player/Camera2D/Labels/ColorRect.visible = false
	$Player/Camera2D/Labels/GurlChat.visible = false
	OnGurl = 0


#Fonction porte milieu (entrée)
func _on_middoor_area_2d_body_entered(body):
	if MidDoorOpen == 0:
		$Player/Camera2D/Labels/ColorRect.visible = true
		$Player/Camera2D/Labels/InteractButton.visible = true
		OnMidDoor = 1
		print_debug(MidDoorOpen)

#Fonction porte milieu (sortie)
func _on_middoor_area_2d_body_exited(body):
	$Player/Camera2D/Labels/ColorRect.visible = false
	$Player/Camera2D/Labels/InteractButton.visible = false
	OnMidDoor = 0
	
	
#Fonction choix d'une anomalie
func anomaly_choice():
	if Anomaly == true and CurrentLvl == 0:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		#var random_number = rng3.randi_range(1, 10)
		var random_number = 10
		
		if random_value < 0.5:
			print("Anomalie facile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$WaterPaint.play("AnomalieE1")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.85:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			

	if Anomaly == true and CurrentLvl == 1:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.45:
			print("Anomalie facile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$WaterPaint.play("AnomalieE1")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.8:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			
			
	if Anomaly == true and CurrentLvl == 2:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.4:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.75:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			
			
	if Anomaly == true and CurrentLvl == 3:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.35:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.7:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			
			
	if Anomaly == true and CurrentLvl == 4:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.3:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.65:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			
			
	if Anomaly == true and CurrentLvl == 5:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.25:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.6:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
			
			
	if Anomaly == true and CurrentLvl == 6:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.2:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.55:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
	
	if Anomaly == true and CurrentLvl == 7:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.15:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.5:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
	
	if Anomaly == true and CurrentLvl == 8:
		rngbis.randomize()
		rng3.randomize()
		var random_value = rngbis.randf()
		var random_number = rng3.randi_range(1, 10)
		
		if random_value < 0.1:
			print("Anomalie facile")
			if random_number == 1:
				$WaterPaint.play("AnomalieE1")
				#$anomalie1.play("anomalie")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$LittleDoor.play("KillerMan")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$NaturePaint.play("Nature")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$WalkingGuy.vitesse_deplacement = 500
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				MidDoorE5 = 1
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$StandingGurl.play("AnomalieE6")
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$Statue1.play("Writing")
				$Statue2.play("Writing")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$SprayTag.visible = true
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$Fissure.visible = true
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Pillars.play("brown")
				$Pillars2.play("brown")
				print("anomalie 10")
				pass
		elif random_value < 0.45:
			print("Anomalie moyenne")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$Statue1.position = Vector2(3840, 704)
				$Statue2.position = Vector2(2560, 704)
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BlinkingPaint.play("Off")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6059, 864)
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$CurrentLvl.scale = Vector2(7, 7)
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$WaterPaint.position = Vector2(1633, 672)
				$NaturePaint.position = Vector2(1952, 451)
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				$BottlePaint.position = Vector2(1247.5, 469.48)
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$SittenGuy.position = Vector2(7013, 864)
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$Cam5.position = Vector2(1944, 231)
				$Cam2.position = Vector2(3601, 272)
				$Cam3.position = Vector2(6244, 349)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$KidPaint.play("Anomalie")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				$Statue1.play("high")
				$Statue2.play("high")
				print("anomalie 10")
				pass
		else:
			print("Anomalie difficile")
			if random_number == 1:
				#$anomalie1.play("anomalie")
				$SittenGuy.play("Beach")
				print("anomalie 1")
				pass
			if random_number == 2:
				#$anomalie1.play("anomalie")
				$BottlePaint.play("open")
				print("anomalie 2")
				pass
			if random_number == 3:
				#$anomalie1.play("anomalie")
				$Light3.play("Off")
				print("anomalie 3")
				pass
			if random_number == 4:
				#$anomalie1.play("anomalie")
				$Bench.play("high")
				print("anomalie 4")
				pass
			if random_number == 5:
				#$anomalie1.play("anomalie")
				$Pillars.play("long")
				$Pillars2.play("long")
				print("anomalie 5")
				pass
			if random_number == 6:
				#$anomalie1.play("anomalie")
				MidDoorD6 = 1
				print("anomalie 6")
				pass
			if random_number == 7:
				#$anomalie1.play("anomalie")
				$BigPaint.play("dark")
				print("anomalie 7")
				pass
			if random_number == 8:
				#$anomalie1.play("anomalie")
				$LittleDoor.position = Vector2(6554, 832)
				$LittleDoor.scale = Vector2(4.8, 4.8)
				print("anomalie 8")
				pass
			if random_number == 9:
				#$anomalie1.play("anomalie")
				$MidDoor.play("nodoorhandle")
				print("anomalie 9")
				pass
			if random_number == 10:
				#$anomalie1.play("anomalie")
				player.speed = 3000.0
				print("anomalie 10")
				pass
	
	
	


func _on_area_pan_2d_body_entered(body):
	$Player/Camera2D/Labels/ColorRect.visible = true
	$Player/Camera2D/Labels/InteractButton.visible = true
	OnPan = 1
	pass # Replace with function body.


func _on_area_pan_2d_body_exited(body):
	$Player/Camera2D/Labels/ColorRect.visible = false
	$Player/Camera2D/Labels/InteractButton.visible = false
	$Player/Camera2D/Labels/PanChat.visible = false
	OnPan = 0
	pass # Replace with function body.


		


