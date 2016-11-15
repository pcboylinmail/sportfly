<!--
function mymedia() { // 自訂函數定義裝置解析度取得與判斷
var myscreen=screen.availWidth; // 取得可瀏覽頁面寬度記錄在變數 myscreen 中
// 如果頁面寬度小於 321，轉址到手機版頁面並停止後續程式
if(myscreen<321) {document.location.href="m_index.html";return;}
// 如果頁面寬度小於 769，轉址到平板電腦版頁面並停止後續程式
if(myscreen<769) {document.location.href="m_index.html";return;}
}
mymedia(); // 呼叫執行自訂函數
//-->
