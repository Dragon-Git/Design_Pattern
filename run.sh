# 递归遍历特定目录，获取所有.sv文件，并调用函数处理每个文件  
find . -type f -name "*.sv" | while read -r singleton_file; do  
    make SRC_FILES=$singleton_file
done  
  