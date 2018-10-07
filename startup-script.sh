str="$*"
port=${@:$#}
second=""
str=${str// $port/$second}
pdb=${str//.exe/.pdb}
rm -rf *.mdb
if [ -f "$pdb" ]; then
   echo "Debug file exists, creating Mono variant, error logs will contain line numbers"
   pdb2mdb "$str"
   sleep 5
   mono --debug "$str" $port nohalt
else
   echo "Debug file (.pdb) not provided, error logs will not contain line numbers."
   mono "$str" $port nohalt
fi