function FindProxyForURL(url, host) {

    /* variable strings to return */
    proxy_slac = "SOCKS 127.0.0.1:8080";
    proxy_cern = "SOCKS 127.0.0.1:8081";
    proxy_jps = "SOCKS 127.0.0.1:8082";
    proxy_no = "DIRECT";
    /* full path match requires FF network.proxy.autoconfig_url.include_path=true, path is stripped by default */
    /* URL matches wont work otherwise, in that case append */ 
    /* shExpMatch(url, "https://www.slac.stanford.edu/*") || */
    /* below */
    if (shExpMatch(url, "https://library.stanford.edu/*") ||
        shExpMatch(url, "http://inspire-*.slac.stanford.edu/*") ||
        shExpMatch(url, "http://link.springer.com/*") ||
        shExpMatch(url, "https://erp-hyrd.erp.slac.stanford.edu/*") ||
        shExpMatch(url, "http://journals.aps.org/*") ||
        shExpMatch(url, "http://ieeexplore.ieee.org/*") ||
        shExpMatch(url, "https://www.sciencedirect.com/*") ||
        shExpMatch(url, "https://voicemail.slac.stanford.edu/*") ||
        shExpMatch(url, "https://tc.lwsng.cnsite.slac.stanford.edu/*") ||
        shExpMatch(url, "https://172.23.78.82/*") ||
        shExpMatch(url, "http://172.24.5.173/*") ||
        shExpMatch(url, "https://internal-slac.stanford.edu/*") ||
        shExpMatch(url, "http://proquest.safaribooksonline.com/*") ||
        shExpMatch(url, "https://www.oreilly.com/*") ||
        shExpMatch(url, "https://researchers.one.org/*") ||
        shExpMatch(url, "http://www-internal-slac.stanford.edu/*") ||
        shExpMatch(url, "https://www-internal.slac.stanford.edu/*") ||
        shExpMatch(url, "https://www-group.slac.stanford.edu/*") ||
        shExpMatch(url, "https://netdb.slac.stanford.edu/*") ||
        shExpMatch(url, "https://atlas-web.cern.ch/*") ||
        shExpMatch(url, "http://icit.archapp.slac.stanford.edu/*") ||
        shExpMatch(url, "http://172.24.5.221*") ||
        shExpMatch(url, "https://identity.slac.stanford.edu/*") ||
        shExpMatch(url, "http://oaweb.slac.stanford.edu/*") ||
        shExpMatch(url, "https://oawork.slac.stanford.edu/*") ||
        shExpMatch(url, "https://ezweb2.slac.stanford.edu/*") ||
        shExpMatch(url, "https://ard-modeling-service.slac.stanford.edu/*") ||
        shExpMatch(url, "https://sdaweb1.sdl.slac.stanford.edu/*") ||
        shExpMatch(url, "https://network.slac.stanford.edu/*") ||
        shExpMatch(url, "http://oracle.slac.stanford.edu/*"))
    return proxy_slac;
}
