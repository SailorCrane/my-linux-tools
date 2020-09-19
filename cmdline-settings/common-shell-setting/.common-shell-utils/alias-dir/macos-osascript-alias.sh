
# alias bid=""
bid() {
    local App=$1
    osascript -e "id of app \"$App\""
}
