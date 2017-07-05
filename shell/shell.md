
# shell

#### 定义环境变量
export VALUE=value

#### 变量说明
变量 | 说明
--- | ---
$0 | 脚本文件名
$n | 脚本的第n个参数，n是数字，$1是第一个参数，如果 n >= 10 需要用大括号阔起来，例：${10}
$# | 参数数量
$* | 获取所有参数，不加双引号和 $@ 相同，如果加上双引号例如 "$*"，则表示将所有参数视为一个字符串，如脚本有3个参数则相当于 "$1 $2 $3"。
$@ | 获取所有参数，不加引号和 $* 相同，如果加上双引号例如 "$@"，则表示将参数视为独立的字符串，如脚本有3个参数则相当于 "$1" "$2" "$3"。这是将多个参数传递给其他程序的最佳方式。

$? 上一个指令执行状态返回值（0为成功，非零为失败）

#### 字符串处理
变量 | 说明
--- | ---
\# | 从开头删除最短匹配
\#\# | 从开头删除最长匹配
% | 从结尾删除最短匹配
%% | 从结尾删除最长匹配