module github.com/lmas/mbaigo_systems/esr

go 1.23.10

require github.com/sdoque/mbaigo v0.0.0-20250520155324-7390c339652a

// Replaces this library with a patched version
replace github.com/sdoque/mbaigo v0.0.0-20250520155324-7390c339652a => github.com/lmas/mbaigo v0.1.0-handoff
