# Composer
https://getcomposer.org/download/  

ハッシュが含まれている。  
バージョンごとにハッシュが変わるんで、後々面倒。  

## Official
おすすめ  

https://github.com/docker-library/php/issues/344#issuecomment-364843883  
```dockerfile
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# バージョンを指定するなら、こんな感じ。
COPY --from=composer:1.8.6 /usr/bin/composer /usr/bin/composer
```


## _
```dockerfile
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```


## __
```dockerfile
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
```


## __
```dockerfile
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
```

