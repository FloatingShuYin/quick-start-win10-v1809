set-executionpolicy remotesigned -s currentuser -f
chcp 936
$GitUserName = "FloatingShuYin"
$GitEmail = "floatshuyin@gmail.com"

# add git ssh
echo '--------------setting git ssh...----------------------'
echo '步骤:'
echo '1.确认秘钥的保存路径(如果不需要改路径则直接回车)'
echo '2.如果上一步置顶的保存路径下已经有秘钥文件，则需要确认是否覆盖(如果之前的秘钥不再需要则直接回车覆盖，如需要则手动拷贝到其他目录后再覆盖)'
echo '3.创建密码(如果不需要密码则直接回车)'
echo '4.确认密码'
git config --global  user.name $GitUserName
git config --global user.email $GitEmail
ssh-keygen -t rsa -C $GitEmail

echo '登录 github 将以下内容↓ copy 到 github SSH keys 的 key 文本框中­'
cat $env:userprofile\.ssh\id_rsa.pub

echo '--------------open webpage...----------------------'
# 打开 web page
start "https://github.com/"
start "https://app.keeweb.info/"
start "https://www.google.cn/chrome/"
echo '--------------open webpage done!----------------------'

Read-Host '操作完成后按任意键继续­'
echo '--------------setting git ssh done!----------------------'
