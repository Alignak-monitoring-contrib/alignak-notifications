#!/bin/sh
echo "The script you are running has basename `basename $0`, dirname `dirname $0`"
echo "The present working directory is `pwd`"

# Assume there will be no errors
ERROR_FOUND=0
# Default is normal
VERBOSE_MODE="0"
# Alignak backend URI
BACKEND="http://127.0.0.1:5000"
# Alignak backend username
USERNAME="admin"
# Alignak backend password
PASSWORD="admin"
# Alignak backend elements Json files
JSON_FILES="`dirname $0`"

usage() {
    cat << END

Usage: $0 [-h|--help] [-b|--backend] [-u|--username] [-p|--password]

 -h (--help)        display this message
 -v (--verbose)     verbose mode
 -b (--backend)     Alignak backend URI (default is http://127.0.0.1:5000)
 -u (--username)    Alignak backend username (default is admin)
 -p (--password)    Alignak backend password (default is admin)
 -f (--files)       Directory where the Json files are located

END
}

for i in "$@"
do
case $i in
    -h|--help)
    usage >&1
    exit 0
    ;;
    -v|--verbose)
    VERBOSE_MODE="1"
    shift
    ;;
    -b|--backend)
    shift
    BACKEND="$1"
    shift
    ;;
    -u|--username)
    shift
    USERNAME="$1"
    shift
    ;;
    -p|--password)
    shift
    PASSWORD="$1"
    shift
    ;;
    -f|--files)
    shift
    JSON_FILES="$i"
    shift
    ;;
esac
done


if [ "$VERBOSE_MODE" = "0" ]; then
    ARGUMENTS="--quiet -b $BACKEND -u $USERNAME -p $PASSWORD"
else
    ARGUMENTS="--verbose -b $BACKEND -u $USERNAME -p $PASSWORD"
fi

# Add commands
echo "alignak-backend-cli $ARGUMENTS -f "$JSON_FILES" -t command -d commands.json add"
alignak-backend-cli $ARGUMENTS -f "$JSON_FILES" -t command -d commands.json add
if [ $? -ne 0 ]; then
    echo "Failed to import file :("
    ERROR_FOUND=$((ERROR_FOUND + 1))
fi

if [ $ERROR_FOUND -ne 0 ]; then
    exit $ERROR_FOUND
fi