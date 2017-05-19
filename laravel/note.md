
#### 查看路由表
```
artisan route:list
```

#### 增加控制器
```
artisan make:controller -r Admin/ImageController
```

#### 增加模型
```
artisan make:model Models/Admin/Image
```

#### migration
```
artisan make:migration create_user --create=user
```

####
```
composer dump-autoload
```

#### 最近执行的sql
```
use Illuminate\Support\Facades\DB;
DB::enableQueryLog();
DB::getQueryLog();
```

#### all routes
```
$routes = app()->routes->getRoutes();
```
