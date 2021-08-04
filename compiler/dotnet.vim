if exists("current_compiler")
	finish
endif
let current_compiler = "dotnet"
setlocal makeprg=dotnet\ build\ /v:q\ /property:GenerateFullPaths=true\ /clp:ErrorsOnly
setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
