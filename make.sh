#!/run/current-system/sw/bin/bash

echo "Enter project name: "
read project_name

echo "Enter language out of (python, go, rust)"
read language

if [ "$language" = "python" ]; then
	echo "Initializing repo for a Python project"
	mkdir "$project_name"
	cd "$project_name"

	# Start a nix-shell with python and create a .venv in the project
	nix-shell -p python3 --run "
	python -m venv .venv
	git init
	touch .gitignore
	echo '.venv/' >> .gitignore
	"

	echo "Project $project_name initialized"
fi
