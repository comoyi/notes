# pprof

## Overview

https://pkg.go.dev/net/http/pprof

## Usage

View all available profiles, open http://127.0.0.1:6060/debug/pprof/ in browser

Parameters https://pkg.go.dev/net/http/pprof#hdr-Parameters

## Usage Example

Option

```
-http
    Provide web interface at host:port.
    Host is optional and 'localhost' by default.
    Port is optional and a randomly available port by default.
```

### Profile (cpu)

Profile for the given duration (web)
```
go tool pprof -http 127.0.0.1:8080 "http://127.0.0.1:6060/debug/pprof/profile?seconds=10"
```

```
go tool pprof -http : "http://127.0.0.1:6060/debug/pprof/profile?seconds=10"
```

Profile for the given duration (shell)

```
go tool pprof "http://127.0.0.1:6060/debug/pprof/profile?seconds=10"
```

### Heap (memory)

Return a profile

```
go tool pprof -http 127.0.0.1:8080 "http://127.0.0.1:6060/debug/pprof/heap"
```

Return a delta profile

```
go tool pprof -http 127.0.0.1:8080 "http://127.0.0.1:6060/debug/pprof/heap?seconds=10"
```

### file

```
go tool pprof <file>
```

```
go tool pprof -http 127.0.0.1:8080 <file>
```

```
go tool pprof -http : <file>
```
