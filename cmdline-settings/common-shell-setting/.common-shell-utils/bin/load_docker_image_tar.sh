# for i in c,3 e,5; do
#     IFS=',' read item1 item2 <<< "${i}"
#     echo "${item1}" and "${item2}"
# done

cat imgs_list | while read -r image file; do
    #echo ["${item1}"] ["${item2}"]
    sudo docker load --input ${file}.tar
done
