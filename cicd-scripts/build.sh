#!/bash/bin
echo "pwd=[$(pwd)]"
ls -al
cd $BOOK_DIR
docker run --rm -p 4000:4000 -v $(pwd):/gitbook onejar99/gitbook:light "gitbook init && gitbook install && gitbook build"
