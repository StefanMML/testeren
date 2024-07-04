extends Button

@onready var clicked_sprite: Sprite2D = null  # Store the clicked sprite
@onready var all_sprites = $"."
 # Replace with actual path

func _ready():
	# Get references to all child Sprite nodes efficiently 
	if all_sprites != null and all_sprites:
		for child in all_sprites:
			if child is Sprite2D:
				child.hide()  # Hide all child Sprite nodes initially

func _on_button_pressed():
	var mouse_pos = get_viewport().get_mouse_position()  # Get mouse position in global coordinates

	# Assuming the target sprite is a child of the Button node
	var clicked_sprite = get_node("target_sprite")  # Replace with actual path

	if clicked_sprite != null and clicked_sprite.rect_global.has_point(mouse_pos):
		# Check if mouse is within the sprite's rectangle (optional)
		if target_sprite != null:
			target_sprite.show()  # Show the target sprite
		# Handle click logic here
	else:
		# Click happened outside the sprite (optional)
		print("Clicked outside the sprite")
		
func hide_other_sprites():  # Optional function
	for child in all_sprites.get_children():
		if child != clicked_sprite and child is Sprite2D:
			child.hide()
