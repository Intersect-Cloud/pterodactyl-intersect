str="$1"
port=${@:$#}
second=""
str=${str// $port/$second}
pdb=${str//.exe/.pdb}
mono --version
params=""
shift;
for item in "$@" ; do
  params="$params$item "
done

rm -rf *.mdb
if [ -f "$pdb" ]; then
   echo "Debug file exists, creating Mono variant, error logs will contain line numbers"
   pdb2mdb "$str"
   sleep 5
   mono --debug "$str" $params
else
   echo "Debug file (.pdb) not provided, error logs will not contain line numbers."
   mono "$str" $params
fi