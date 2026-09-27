const CACHE_NAME = "sarkari-manzil-v3";

self.addEventListener("install", function (event) {
    console.log("Service Worker Installed");
});

self.addEventListener("fetch", function (event) {
    // no cache for now
});