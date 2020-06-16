var FindProxyForURL = function(init, profiles) {
    return function(url, host) {
        "use strict";
        var result = init, scheme = url.substr(0, url.indexOf(":"));
        do {
            result = profiles[result];
            if (typeof result === "function") result = result(url, host, scheme);
        } while (typeof result !== "string" || result.charCodeAt(0) === 43);
        return result;
    };
}("+myProfile", {
    "+myProfile": function(url, host, scheme) {
        "use strict";
        if (/baidu/.test(host) || /sina/.test(host) || /note\.youdao/.test(host) || /csdn/.test(host)) return "DIRECT";
        return "SOCKS5 localhost:1080; SOCKS localhost:1080";
    }
});