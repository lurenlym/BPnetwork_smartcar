<html lang="en"><head>
    <meta charset="UTF-8">
    <title></title>
<style id="system" type="text/css">h1,h2,h3,h4,h5,h6,p,blockquote {    margin: 0;    padding: 0;}body {    font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB", Arial, sans-serif;    font-size: 13px;    line-height: 18px;    color: #737373;    margin: 10px 13px 10px 13px;}a {    color: #0069d6;}a:hover {    color: #0050a3;    text-decoration: none;}a img {    border: none;}p {    margin-bottom: 9px;}h1,h2,h3,h4,h5,h6 {    color: #404040;    line-height: 36px;}h1 {    margin-bottom: 18px;    font-size: 30px;}h2 {    font-size: 24px;}h3 {    font-size: 18px;}h4 {    font-size: 16px;}h5 {    font-size: 14px;}h6 {    font-size: 13px;}hr {    margin: 0 0 19px;    border: 0;    border-bottom: 1px solid #ccc;}blockquote {    padding: 13px 13px 21px 15px;    margin-bottom: 18px;    font-family:georgia,serif;    font-style: italic;}blockquote:before {    content:"C";    font-size:40px;    margin-left:-10px;    font-family:georgia,serif;    color:#eee;}blockquote p {    font-size: 14px;    font-weight: 300;    line-height: 18px;    margin-bottom: 0;    font-style: italic;}code, pre {    font-family: Monaco, Andale Mono, Courier New, monospace;}code {    background-color: #fee9cc;    color: rgba(0, 0, 0, 0.75);    padding: 1px 3px;    font-size: 12px;    -webkit-border-radius: 3px;    -moz-border-radius: 3px;    border-radius: 3px;}pre {    display: block;    padding: 14px;    margin: 0 0 18px;    line-height: 16px;    font-size: 11px;    border: 1px solid #d9d9d9;    white-space: pre-wrap;    word-wrap: break-word;}pre code {    background-color: #fff;    color:#737373;    font-size: 11px;    padding: 0;}@media screen and (min-width: 768px) {    body {        width: 748px;        margin:10px auto;    }}</style><style id="custom" type="text/css"></style></head>
<body marginheight="0"><h1>BPnetwork_smartcar</h1>
<h3>my project display</h3>
<pre><code>[BP神经网络循迹小车]（http://video.tudou.com/v/XMjcwMDE1MTcwMA==.html）</code></pre>
<h3>Devices:</h3>
<pre><code>Raspberry_pi3b+ 
NXP_smartcar game model
Computer</code></pre>
<h3>Dependencies：</h3>
<pre><code>Computer：
    opencv3.4
    Numpy
    PiSerial
    Pygame

Raspberry Pi:
    Picamera
    Piserual

model_car:
    K60</code></pre>
<h3>Running:</h3>
<pre><code>1. Run pi_stream.py in raspberr_pi firstly.
2. Run computer_training_date_collect.py in the computer and use joy to control 
   model_car to collet training_date.The date will be saved in a .npz file
3. Run computer_mlp_training.py in the computer.The network_model will be saved in a
   .xlm file.
4. Run computer_mydriver.py in the computer.The model_car should be run automatically </code></pre>
<h3>Note:</h3>
<pre><code>* I set up communications between car and computer by HC05 Bluetooth.
* You should download the code into car in advance and make sure your car can  
  be controled by computer's command well</code></pre>
<p>Edit By <a href="http://mahua.jser.me">MaHua</a></p>
</body></html>