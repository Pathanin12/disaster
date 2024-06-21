'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9489e5b076d9474cbb802c31b31e4304",
"version.json": "db125d5f3eb37e9bfe19d7cf7144fb19",
"index.html": "018033e370e266fe6420b6c32a85da75",
"/": "018033e370e266fe6420b6c32a85da75",
"main.dart.js": "31d5d26187ebbc096a6011214f2022ba",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b5ba6209e417f3eb769eeaa78383030e",
"assets/AssetManifest.json": "01e98fcf192ee7c1a759b9cadeb6a6d1",
"assets/NOTICES": "ca68d30bfd5ecaa45e5809dd19f5e965",
"assets/FontManifest.json": "9569cadd4a8b262ae4f2ddc285d7a1d9",
"assets/AssetManifest.bin.json": "511ef195fd3fe0f80181c8a624af9f4a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "cdfe4bdb371489bea7826475ac073d89",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5f6aeb385bb356d8b4a348f7eae14d5e",
"assets/fonts/MaterialIcons-Regular.otf": "a35f36300f6b31b3df0142e4ea457389",
"assets/assets/logo/logo.png": "9746500c71cb546e828bffef40dbff0b",
"assets/assets/logo/logo.svg": "f25a2674362032632f30084f4ecc95d4",
"assets/assets/icons/svg/reportmain.svg": "c79100ec2ff10dd734791135b81fe341",
"assets/assets/icons/svg/report2.svg": "18f2caf06e9c566ab969514eb8916295",
"assets/assets/icons/svg/fire0.svg": "3935610fee40ba5eac29ad0fc9677f46",
"assets/assets/icons/svg/fire1.svg": "d1432e1eb6adf65680fd932e43108fdf",
"assets/assets/icons/svg/windstorm2.svg": "7ad9f286655ecbe408ab2420c0ee1a8f",
"assets/assets/icons/svg/report3.svg": "3c0109a2f9bd99c35d0709e7253f749f",
"assets/assets/icons/svg/report1.svg": "ba2076656b3cc8d970c38ba83fda172f",
"assets/assets/icons/svg/windstorm0.svg": "9e03e9fd6fb1dae6f4e308815d86e295",
"assets/assets/icons/svg/fire2.svg": "fc6c2aa0ab6f75af6b602c0d22c70a68",
"assets/assets/icons/svg/windstorm1.svg": "c0ddd324125062dd3b922dec19ef23fa",
"assets/assets/icons/svg/report4.svg": "7c534ad19f8bf4346eeba540181ce0cf",
"assets/assets/icons/svg/flood1.svg": "76bd7c4173dbae6539ba9a89cf5e8750",
"assets/assets/icons/svg/flood0.svg": "80f8e7d47e437288ad0f00aff25df5c1",
"assets/assets/icons/svg/flood2.svg": "d44557ff59443cd2d1a036f5e9f9a189",
"assets/assets/icons/svg/forestfire2.svg": "82cedc55c427135bb38e3d0c3c9b4d64",
"assets/assets/icons/svg/forestfire1.svg": "642a218f2e1e027cb43036745d180b76",
"assets/assets/icons/svg/forestfire0.svg": "7c55daa6f5a8c1449094fe5e406f3bff",
"assets/assets/icons/iconlocation.svg": "1ed543862b231da2252b027068ab9f95",
"assets/assets/icons/locationwindstorm.svg": "4f3952c849e3a3b56436d64d8df59c21",
"assets/assets/fonts/THSarabunNew.ttf": "4c9a6e3d203c26982281fdda16ab5712",
"assets/assets/data/data.json": "2d26c8dda523bdff9817628a37056214",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
