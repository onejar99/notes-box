## File API

### Reference

* [通过 File API 使用 JavaScript 读取文件](https://www.html5rocks.com/zh/tutorials/file/dndfiles/) (**recommended**)
* [康廷數位: JavaScript 利用FileReader 讀取文字檔](http://www.kangting.tw/2012/09/html5-filereader.html)
* [探索 FileSystem API](https://www.html5rocks.com/zh/tutorials/file/filesystem/)
* [FileReader - Web APIs - MDN - Mozilla](https://developer.mozilla.org/zh-TW/docs/Web/API/FileReader)
* [FileReader JavaScript API](http://www.javascripture.com/FileReader)



### Note

Excerpts from [通过 File API 使用 JavaScript 读取文件](https://www.html5rocks.com/zh/tutorials/file/dndfiles/)

* HTML5 終於為我們提供了一種通過 File API 規範與本地文件交互的標准方式。

* 該規範通過“本地”文件系統提供了多種文件訪問接口：
  1. File - 獨立文件；提供只讀信息，例如名稱、文件大小、mimetype 和對文件句柄的引用。
  2. FileList - File 對像的類數組序列（考慮 <input type="file" multiple> 或者從桌面拖動目錄或文件）。
  3. Blob - 可將文件分割為字節範圍。

* FileReader
  * FileReader 接口可用於通過熟悉的 JavaScript 事件處理來異步讀取文件。因此，可以監控讀取進度、找出錯誤並確定加載何時完成。
  * FileReader 包括四個異步讀取文件的選項：
    1. FileReader.readAsBinaryString(Blob|File) - result 屬性將包含二進制字符串形式的 file/blob 數據。每個字節均由一個 [0..255] 範圍內的整數表示。
    2. FileReader.readAsText(Blob|File, opt_encoding) - result 屬性將包含文本字符串形式的 file/blob 數據。該字符串在默認情況下采用“UTF-8”編碼。使用可選編碼參數可指定其他格式。
    3. FileReader.readAsDataURL(Blob|File) - result 屬性將包含編碼為數據網址的 file/blob 數據。
    4. FileReader.readAsArrayBuffer(Blob|File) - result 屬性將包含 ArrayBuffer 對像形式的 file/blob 數據。
  * 對您的 FileReader 對像調用其中某一種讀取方法後，可使用 onloadstart、onprogress、onload、onabort、onerror 和 onloadend 跟蹤其進度。


### Examples

#### Example 1: 讀取單一文字檔，顯示在畫面上

````html
<body>
    <p> <input id="myfile" type="file" /></p>
    <textarea  id="fileContent" cols="68" rows="10"  ></textarea>
</body>
<script>
window.onload = function () {
    document.getElementById('myfile').onchange = readFile;
};
function readFile() {
    file = this.files[0];
    var fReader = new FileReader();
    fReader.onload = function (event) {
        document.getElementById('fileContent').value = event.target.result;
    };
    fReader.readAsText(file);
}
</script>
````


#### Example 2: 讀取複數檔，在畫面上顯示檔案的meta資訊

````html
<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<script>

checkFileApiSupport();
document.getElementById('files').addEventListener('change', handleFileSelect, false);

function checkFileApiSupport(){
  //檢查瀏覽器是否完全支持 File API
  //如果應用程序只會用到這些 API 中的一小部分，請相應地修改此代碼段。

  // Check for the various File API support.
  if (window.File && window.FileReader && window.FileList && window.Blob) {
    // Great success! All the File APIs are supported.
    console.log('ok');
  } else {
    alert('The File APIs are not fully supported in this browser.');
    console.log('sad');
  }
}

function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      //format:Json100r3.zip (application/x-zip-compressed) - 6317497 bytes, last modified: 2018/1/22
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate.toLocaleDateString(), '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }
</script>
````

#### Example 3: 支援拖曳方式

````html
<div id="drop_zone">Drop files here</div>
<output id="list"></output>

<script>
  function handleFileSelect(evt) {
    evt.stopPropagation();
    evt.preventDefault();

    var files = evt.dataTransfer.files; // FileList object.

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate.toLocaleDateString(), '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }

  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }

  // Setup the dnd listeners.
  var dropZone = document.getElementById('drop_zone');
  dropZone.addEventListener('dragover', handleDragOver, false);
  dropZone.addEventListener('drop', handleFileSelect, false);
</script>
````

