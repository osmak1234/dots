#!/bin/bash

args=("$@") # Store all arguments passed to the script

# Function to run cargo watch and wait for Enter
run_cargo_watch() {
	while true; do
		cargo watch "${args[@]}"
		echo "Press Enter to rerun, or Ctrl+C to exit."
		read -r
	done
}

# Call the function to run cargo watch
run_cargo_watch
