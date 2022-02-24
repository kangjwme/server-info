# server-info
一個可以檢測伺服器所有相關資訊的腳本，目前用於 https://kangjw.me 的主機評測中

#  V2用法
v2刪減掉了許多功能，加速整體測試進行，如果需要非常詳細報告請使用v1

在 Ubuntu 20.04 及 Debian 10 均可以正常運行，套件將自行安裝
```
wget https://github.com/kangjwme/server-info/raw/main/kkbench2.sh
bash kkbench2.sh | tee log.txt
```
所有輸出資訊會同步輸出到終端及log.txt，整體耗時約為15分鐘，建議可以開screen運行
另外，也可以透過附加參數指定測試項目，舉例來說：
```
-info：系統資訊
-i：前置安裝運行
-dd：硬碟DD測試
-fio：硬碟fio測試
-spnet：speedtest.net測試
-videotest：媒體解鎖測試
-g4：GeekBench4測試
-g5：GeekBench5測試

範例用法：bash kkbench2.sh -info | tee log.txt
（只測試系統基本資訊並且輸出到log.txt中）
```


#  V1用法

在 Ubuntu 20.04 及 Debian 10 均可以正常運行
```
apt update
apt install git fio python3 p7zip-full curl make gcc -y
wget https://github.com/kangjwme/server-info/raw/main/kkbench.sh
bash kkbench.sh | tee log.txt
```
所有輸出資訊會同步輸出到終端及log.txt，整體耗時約為45分鐘，建議可以開screen運行
