require "ghee"

gh = Ghee.basic_auth("usr", "pwd")
all_gists = gh.user("nusco").gists
a_gists = all_gists[20]

p a_gists.url
p a_gists.description