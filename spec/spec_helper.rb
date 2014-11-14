def sample_config
  [ "# This is a sample config",
		"# A bunch of lines that will be in a file",
		"# Because thats what its all about",
		"test=%{ITEM1}",
		"test2=%{ITEM2}",
		"test3=%{ITEM3}"
	].join("\n")
end
