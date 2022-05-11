export Directory=$1

git -C $Directory status --porcelain | awk '{print $2}' | 
while read change; do
    export File=$Directory/$change
    export FileName=$(basename $File)
    export Extension=${File#*.}
    export FileDirectory=$(dirname $File)
    if [[ $FileDirectory == *"Site"* ]]; then
        /HolismHolding/Policies/Next/Run.sh
    else
        echo "Not next policies"
    fi
done