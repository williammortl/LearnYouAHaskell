# DO NOT RUN, just a reference

# init cabal
cabal init --non-interactive --minimal --exe --package-name=webserver

# build with cabal
cabal build

# run with cabal
cabal run webserver -- .
