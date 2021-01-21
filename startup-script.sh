pdb="Intersect Server.pdb"
mono --version | head -1
params=""

for item in "$@" ; do
  params="$params$item "
done

rm -rf *.mdb
if [ -f "$pdb" ]; then
   echo "Debug file exists, creating Mono variant, error logs will contain line numbers"
   pdb2mdb "Intersect Server.exe"
   sleep 5
   LD_LIBRARY_PATH=. mono --debug "Intersect Server.exe" $params
else
   echo "Debug file (.pdb) not provided, error logs will not contain line numbers."
   LD_LIBRARY_PATH=. mono "Intersect Server.exe" $params
fi
