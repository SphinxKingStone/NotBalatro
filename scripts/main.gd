extends Control


func _on_check_button_toggled(toggled_on) -> void:
	$Card.card_texture.material.set_shader_parameter("enable_scales", toggled_on)
	$CheckButton.material.set_shader_parameter("enabled", toggled_on)
