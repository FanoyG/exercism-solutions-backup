panagram(){
    if [ $# -eq 0 ]; then
        echo "Usage: $0 <string>"
        return 1
    fi
    local str="$*"
    local str=${str,,}
    local str=${str//[^a-z]/}
    local str
    str=$(echo "$str" | sed 's/\(.\)/\1\n/g' | sort | uniq | tr -d '\n')
    [ ${#str} -eq 26 ] && echo "true" || echo "false"
}
panagram "$@"