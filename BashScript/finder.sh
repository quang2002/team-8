# foreach file in a directory, run a command

traversal() {
    for file in "$1"/*
    do
        if [ -d "$file" ]
        then
            traversal "$file"
        else
            cat "$file"
            echo " "
        fi
    done
}

traversal "./FileFinder"

# FLAG{h0w_c0nv3n1ent_f1nd_i5_5f1d32} 