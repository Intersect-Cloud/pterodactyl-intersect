pdb="Intersect Server.pdb"
mono --version
params=""
shift;
for item in "$@" ; do
  params="$params$item "
done

rm -rf *.mdb
if [ -f "$pdb" ]; then
   echo "Debug file exists, creating Mono variant, error logs will contain line numbers"
   pdb2mdb "$pdb"
   sleep 5
   mono --debug "Intersect Server.exe" $params
else
   echo "Debug file (.pdb) not provided, error logs will not contain line numbers."
   mono "Intersect Server.exe" $params
fi