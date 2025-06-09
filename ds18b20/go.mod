module github.com/lmas/mbaigo_systems/ds18b20

go 1.23.10

require (
	github.com/sdoque/mbaigo v0.0.0-20250520155324-7390c339652a
	golang.org/x/exp v0.0.0-20250606033433-dcc06ee1d476
)

// Replaces this library with a patched version
replace github.com/sdoque/mbaigo v0.0.0-20250520155324-7390c339652a => github.com/lmas/mbaigo v0.1.0-handoff
