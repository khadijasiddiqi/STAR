extends CharacterBody2D

var ornimant_count = 0

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * 400
	move_and_slide()


func _on_pickup_2d_area_entered(area):
	if area.is_in_group("ornimant") and not $heldornimant.visible:
		area.queue_free()
		$heldornimant.visible = true
	if area.is_in_group("potion") and $heldornimant.visible:
		$heldornimant.visible = false
		ornimant_count +=1
		$CanvasLayer/ornimantcountdisplay.text = "ornimants: " + str(ornimant_count)
	
