# cat >/tmp/demo-equals-separated.sh <<'EOF'
# #!/bin/bash

for i in "$@"
do
case $i in
  # EXAMPLE OF KEY/VALUE ARGUMENT
  -u=*|--windows-user=*|--user=*)
  WINDOWS_USER="${i#*=}"
  shift # past argument=value
  ;;

  # EXAMPLE OF UNARY ARGUMENT
  --default)
  DEFAULT=YES
  shift # past argument with no value
  ;;
  *)
  
  # unknown option
  ;;
esac
done

echo "WINDOWS USER    = ${WINDOWS_USER}"
echo "DEFAULT         = ${DEFAULT}"

# EOF

# chmod +x /tmp/demo-equals-separated.sh

# /tmp/demo-equals-separated.sh -u=Ragan