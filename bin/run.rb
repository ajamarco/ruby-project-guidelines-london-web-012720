require_relative '../config/environment'




NewGame.welcome

name = NewGame.pick_name

name = NewGame.welcome_user(name)

char = NewGame.pick_class(name)


