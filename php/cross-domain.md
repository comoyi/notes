# cross domain

## 跨多个指定的域

```php
// 跨多个指定的域
$allowOrigins = [
    'http://h5.xxx.com',
    'http://h5.ccc.com',
];

$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
if (in_array($origin, $allowOrigins)) {
    header("Access-Control-Allow-Origin: $origin");
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, Content-Range, Content-Disposition, Content-Description');
    header('Access-Control-Allow-Credentials: true');
}
`````

## 跨一个域

```php
header("Access-Control-Allow-Origin: http://h5.xxx.com");
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Content-Range, Content-Disposition, Content-Description');
header('Access-Control-Allow-Credentials: true');
`````
