BEGIN {
    word
    line = 0
}

{
    line++
    for(i=1; i<=NF; i++){
        if (word == $i) {
            print "[line: " line "]" "\t" "[position: " i "]" "\t" $0
        }
    }
}
