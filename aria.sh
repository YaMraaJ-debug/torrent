export MAX_DOWNLOAD_SPEED=0
tracker_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/best.txt | awk '$1' | tr '\n' ',')
export MAX_CONCURRENT_DOWNLOADS=25
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 6800 \
  --max-connection-per-server=10 --rpc-max-request-size=1024M \
  --bt-tracker="[$tracker_list]" --bt-max-peers=0 --seed-time=0.01 \
  --min-split-size=10M --follow-torrent=mem --split=10 \
   --daemon=true --allow-overwrite=true --max-overall-download-limit=$MAX_DOWNLOAD_SPEED --bt-stop-timeout=480 \
   --max-overall-upload-limit=1K --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS \
   --peer-agent=qBittorrent/4.2.5 --peer-id-prefix=-qB4250-
