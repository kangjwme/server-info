# server-info
一個可以檢測伺服器所有相關資訊的腳本，目前用於 https://kangjw.me 的主機評測中

#  用法

在 Ubuntu 20.04 及 Debian 10 均可以正常運行
```
apt update
apt install git fio python3 p7zip-full curl make gcc -y
wget https://github.com/kangjwme/server-info/raw/main/kkbench.sh
bash kkbench.sh | tee log.txt
```
所有輸出資訊會同步輸出到終端及log.txt，整體耗時約為45分鐘，建議可以開screen運行

# 檢測項目
- 系統基本資訊（CPU、記憶體、儲存空間、內核版本、作業系統、數據中心位置等等）
- 硬碟讀取寫入測試（dd、fio）
- Speedtest官方CLI測試（共五次）
- 全球節點測試
- 全球延遲測試
- GeekBench4
- GeekBench5
- UnixBench
