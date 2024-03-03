# 定义函数，用于处理单个singleton文件  
function run_verilator_and_make() {  
    local singleton_file=$1  
    local singleton=$(basename "$singleton_file" .sv) # 提取不带扩展名的文件名  
    local obj_dir="obj_dir_$singleton" # 可以为每个singleton创建一个单独的obj_dir，或者使用统一的obj_dir  
    local makefile="V${singleton}.mk"  
    local executable="obj_dir/V${singleton}"  
  
    # 使用变量构建并执行命令  
    verilator -cc -exe --main $singleton_file  
    make -C obj_dir -f "$makefile"
    "$executable" # 执行生成的可执行文件  
}  
  
# 递归遍历特定目录，获取所有.sv文件，并调用函数处理每个文件  
traverse_and_run() {  
    local directory=$1  
    find "$directory" -type f -name "*.sv" | while read -r singleton_file; do  
        run_verilator_and_make "$singleton_file"  
    done  
}  
  
# 使用函数，遍历指定的目录  
traverse_and_run .