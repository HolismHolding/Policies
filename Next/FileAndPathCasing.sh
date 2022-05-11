. /HolismHolding/Infra/Scripts/Message.sh

permitted=("components" "pages" "public" "contents")
for pathSegment in "${FileDirectoryParts[@]}"; do
    if [[ ! "${pathSegment:0:1}" =~ [[:upper:]] ]]; then
        if [[ ! "${permitted[*]}" =~ "${pathSegment}" ]]; then
            Warning "File $File has a path segment that is in lowercase. Make it PascalCased."
        fi
    fi
done