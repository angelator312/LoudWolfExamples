extends Control
class_name LeaderboardScript


const SCORE_ITEM = preload("score_item.tscn")
@onready var container: VBoxContainer = $M/V/Container
@onready var player_name: LineEdit = %PlayerName
@onready var score: LineEdit = %Score


func _ready() -> void:
	LoudWolf.configure_api_key("CsCNpHfeeI4Tvt3u8y8Du6z1PzrWwkak6Y6YyWxY")
	LoudWolf.configure_game_id("examplegame1")
	make_scores()


func make_scores():
	await LoudWolf.Scores.get_scores(0)
	var i:=0
	for sc in LoudWolf.Scores.scores:
		add_item(sc,i)
		i+=1


func add_item(sc,i:int):
	var e:=SCORE_ITEM.instantiate()
	e.order_idx=i+1
	e.player_name=sc.player_name
	e.score=sc.score
	container.add_child(e)


func delete_scores():
	for e in container.get_children():
		e.queue_free()


func _on_add_score_pressed() -> void:
	await LoudWolf.Scores.save_score(player_name.text,score.text)
	delete_scores()
	make_scores()
