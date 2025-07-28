extends Node

const player_name:="TestSubject312"
const score:=312

func add_scores() -> void:
	await LoudWolf.Scores.save_score(player_name, score)
	
func list_high_scores(x:int) -> void:
	await LoudWolf.Scores.get_score(x).sw_save_score_complete
	var scores:=LoudWolf.Scores.scores
	for score in scores:
		# score is stringified number(float)
		print("Another score:",(score.score))

func get_scores_of_specific_player()->void:
	await LoudWolf.Scores.get_scores_by_player(player_name)
	var player_scores:= str(LoudWolf.Scores.scores)
	print("Got: " + str(LoudWolf.Scores.scores.size()) + " scores for player: " + str(player_name))

func get_top_score_of_specific_player() -> void:
	await LoudWolf.Scores.get_top_score_by_player(player_name)
	print("Got top player score: " + str(LoudWolf.Scores.score))

func get_score_position() -> void:
	await LoudWolf.Scores.get_score_position(score)
	var position = LoudWolf.Scores.position
