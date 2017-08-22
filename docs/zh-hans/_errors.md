# 错误

在遇到问题后，服务器会停止运作并返回正确的
HTTP错误代码。错误有时会额外包含错误的对象，返回为JSON API文本中最外层键为`errors`的列表。 

一个错误的对象包含以下：

* `title`: (Required) the HTTP status code applicable to this problem, expressed as a
  string value.
* `description`: (Optional) a short summary of the problem

服务器使用如下的错误代码：

错误代码 | 含义
---------- | -------
400 | 错误请求 -- 您的请求有误
401 | 未授权 -- 您的API密钥有误
403 | 被禁止 -- 请求的对象仅限管理员
404 | 未发现 -- 未发现具体的查找对象
405 | 方法不允许 -- 您试图使用不允许的方法来获得一个对象
406 | 无法接受 -- 您请求的格式非JSON
410 | Gone -- 所请求的对象已被移出服务器
418 | I'm a teapot
429 | 太多请求 -- 您请求的数据过多！请慢！
500 | 内部服务器出错 -- 我们的服务器出错。请稍候再试。
503 | 服务不可用 -- 暂时离线维护中。请稍候再试。
