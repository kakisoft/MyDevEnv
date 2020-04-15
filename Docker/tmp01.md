## conf
```
set -e - exit script if any command fails (non-zero value)

exec "$@" - will redirect input variables, see more here

"$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
```
<https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts>  
<https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables>  

```
exec "$@" is typically used to make the entrypoint a pass through that then runs the docker command. It will replace the current running shell with the command that "$@" is pointing to. By default, that variable points to the command line arguments.


通常、exec "$ @"はエントリポイントをパススルーにしてからdockerコマンドを実行するために使用されます。現在実行中のシェルを "$ @"が指しているコマンドに置き換えます。デフォルトでは、その変数はコマンドライン引数を指しています。
```
<https://nickjanetakis.com/blog/fixing-exec-format-errors-with-docker-entrypoint-scripts-on-windows>

