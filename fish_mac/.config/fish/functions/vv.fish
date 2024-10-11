function vv
    set dir (pwd)
    while test "$dir" != "/"
        if test -d "$dir/.venv"
           echo source "$dir/.venv/bin/activate.fish"
           source "$dir/.venv/bin/activate.fish"
           break
        end
        set dir (dirname "$dir")
    end
end
