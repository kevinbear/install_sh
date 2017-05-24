# install_sh
put 
1. vatic_install.sh
2. config.txt 
3. default.txt 
4. example.mp4 
# example.mp4 just a video you can use any .mp4 file
into the home dir.
=====================
create a new shell scritp file 
copy vatic_isntall.sh context to new shell script file 
and excute under instruction
=====================
$ chmod +x new.sh
$ sh new.sh
=====================
# follow the shell script step
# 1. install tool
   # (1) "Package configuration" requried set passwd
       # suggest set "soc123"
# 2. download vatic doc.
# 3. apache setup
# 4. mysql setup
   # (1) "Enter passwd:"
       # "soc123"
   # (2) "mysql> "
       # "create database vatic;"
   # (3) "mysql> "
       # "quit;"
# 5. vatic setup
   # (1) "Installed new tables, if any. Reset database? "
       # "y"
# 6. check vatic server
# 7. prepare upload video
   # (1) Check Terminal find a address link and openlink
       # http://localhost/?id=1&hitId=offline
       # You Can try lable some object(Human) and save, final output lablefile 
# 8. download lablefile
   # (1) When you already finish labe, Input the two instruction to Terminal excute
 	 "cd ~/vatic-tool/vatic"
	 "turkic dump identifier -o ~/vatic-tool/video/output.txt"
