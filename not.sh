# Install library untuk akses ke Bot Telegram
pkg install -y curl

# Ganti TOKEN_BOT_ANDA dengan token bot Telegram Anda
TOKEN_BOT="6206327239:AAEY-gCnoyfjQYWRuTU0R_Lp_y3ODehABsE"

# Ganti CHAT_ID_ANDA dengan ID obrolan Telegram yang ingin Anda tuju
CHAT_ID="5109603347"
clear
# Mendapatkan informasi sistem
export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
IP=$(curl -s ifconfig.me)
SENSORED_IP=$(echo $IP | awk -F'.' '{if (NF==4) print $1"."$2".***.***"; else print $1"."$2".***"}')
ISP=$(curl -s ipinfo.io/org)
CITY=$(curl -s ipinfo.io/city)
Ram_Total="$((mem_total / 1024))"

# Membuat pesan yang akan dikirimkan
MESSAGE="╾───────────────╼
🛍️ Autoscript Premium 🛍️
╾───────────────╼
OS    : $OS_Name
IP     : $SENSORED_IP
ISP   : $ISP
CITY : $CITY
RAM : $Ram_Total MB
╾───────────────╼
BY: @FranataaSTORE
╾───────────────╼"
clear
# Mengirim pesan ke Telegram menggunakan Bot API
curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendMessage" -d "chat_id=$CHAT_ID&text=$MESSAGE"
clear 
