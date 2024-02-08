#checking whether the number is even or not.
for i in {1..10}; do
    if [ $(expr $i % 2) -eq 0 ]; then
        echo "$i is even"
    else
        echo "$i is odd"
    fi
done
