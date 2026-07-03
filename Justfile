default:
    @just --list


dev:
    caddy start
    firefox -url localhost:1234 &
    watchexec --restart --verbose --wrap-process=session --stop-signal SIGTERM --exts gleam,mjs,js,djot,css,html --debounce 500ms --watch src/ --watch static/ -- "gleam run"
    

caddy:
    caddy start

