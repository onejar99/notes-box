#!/bash/bin

function checkIfErr() {
    ret=$?
    echo "ret=[${ret}]"
    if [ ! $ret = '0' ]; then
        echo "Oops something wrong! exit code: ${ret}"
        exit $ret;
    fi
}

echo "pwd=[$(pwd)]"
ls -al
cd $BOOK_DIR
docker run --rm -p 4000:4000 -v $(pwd):/gitbook onejar99/gitbook:light "gitbook init && gitbook install && gitbook build"
checkIfErr
