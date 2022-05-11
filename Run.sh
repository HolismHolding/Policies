export Directory=$1

git -C $Directory status --porcelain | awk '{print $2}' | 
while read change; do
    export File=$Directory/$change
    export FileName=$(basename $File)
    export Extension=${File#*.}
    export FileDirectory=$(dirname $File)
    IFS='/' read -ra FileDirectoryParts <<< "$FileDirectory"
    export FileDirectoryParts=$FileDirectoryParts
    if [[ $FileDirectory == *"Site"* ]]; then
        source /HolismHolding/Policies/Next/Run.sh
    else
        echo 
    fi
done