'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "db125d5f3eb37e9bfe19d7cf7144fb19",
"index.html": "dbc5f28891d0c9a9bfa5d16867eb846b",
"/": "dbc5f28891d0c9a9bfa5d16867eb846b",
"main.dart.js": "4f0b21c56f8087cb32bdb7c1b34c47e1",
"jsQR.js": "d54b99cd32c7a3c35dc7df755ee1e137",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b5ba6209e417f3eb769eeaa78383030e",
"assets/AssetManifest.json": "d2bd0ed2e813b882b4fba58fb46a441e",
"assets/NOTICES": "01158264fb352d552e3535f2d52dade4",
"assets/FontManifest.json": "ba4cdb04638cb65b9551f9885a51ae24",
"assets/AssetManifest.bin.json": "b6192b5c41cfc46fdaa339392917dbf2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "d50f0b44e84fc6fdc1714791e7b24ff9",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "411912246cabba9f00c070ef8072e34a",
"assets/fonts/MaterialIcons-Regular.otf": "396ecb2583dd160c14ace6a6a795bfbb",
"assets/assets/logo/logoooo.png": "90bef8e39a17d81eff07e15ccad51caa",
"assets/assets/logo/logo.png": "9746500c71cb546e828bffef40dbff0b",
"assets/assets/logo/logo.svg": "f25a2674362032632f30084f4ecc95d4",
"assets/assets/icons/svg/reportmain.svg": "c79100ec2ff10dd734791135b81fe341",
"assets/assets/icons/svg/freeform.svg": "2d9f136bf66b1618c6ea3e1193e9f265",
"assets/assets/icons/svg/report2.svg": "18f2caf06e9c566ab969514eb8916295",
"assets/assets/icons/svg/fire0.svg": "3935610fee40ba5eac29ad0fc9677f46",
"assets/assets/icons/svg/fire1.svg": "d1432e1eb6adf65680fd932e43108fdf",
"assets/assets/icons/svg/windstorm2.svg": "7ad9f286655ecbe408ab2420c0ee1a8f",
"assets/assets/icons/svg/freeform2.svg": "1091ea30cd2f73962d2acb85032fafc0",
"assets/assets/icons/svg/report3.svg": "3c0109a2f9bd99c35d0709e7253f749f",
"assets/assets/icons/svg/report1.svg": "ba2076656b3cc8d970c38ba83fda172f",
"assets/assets/icons/svg/freeform0.svg": "28c47ab2479ae790dee378ae7e4a7465",
"assets/assets/icons/svg/windstorm0.svg": "9e03e9fd6fb1dae6f4e308815d86e295",
"assets/assets/icons/svg/fire2.svg": "fc6c2aa0ab6f75af6b602c0d22c70a68",
"assets/assets/icons/svg/windstorm1.svg": "c0ddd324125062dd3b922dec19ef23fa",
"assets/assets/icons/svg/freeform1.svg": "efd62f82325b45efc8fb6b8f445a674b",
"assets/assets/icons/svg/report4.svg": "7c534ad19f8bf4346eeba540181ce0cf",
"assets/assets/icons/svg/flood1.svg": "76bd7c4173dbae6539ba9a89cf5e8750",
"assets/assets/icons/svg/flood0.svg": "80f8e7d47e437288ad0f00aff25df5c1",
"assets/assets/icons/svg/flood2.svg": "d44557ff59443cd2d1a036f5e9f9a189",
"assets/assets/icons/svg/forestfire2.svg": "82cedc55c427135bb38e3d0c3c9b4d64",
"assets/assets/icons/svg/forestfire1.svg": "642a218f2e1e027cb43036745d180b76",
"assets/assets/icons/svg/forestfire0.svg": "7c55daa6f5a8c1449094fe5e406f3bff",
"assets/assets/icons/iconapp.png": "11f13f045790fead418647877f16d44d",
"assets/assets/icons/iconlocation.svg": "1ed543862b231da2252b027068ab9f95",
"assets/assets/icons/locationwindstorm.svg": "4f3952c849e3a3b56436d64d8df59c21",
"assets/assets/icons/icon/icon8.svg": "8fdf1b057b0f67e622d20fbc713021a8",
"assets/assets/icons/icon/icon9.svg": "add8a640847e240c84f4cdb4469ebba6",
"assets/assets/icons/icon/icon12.svg": "752b45d5c3e0b1c47b5a85df62e70be2",
"assets/assets/icons/icon/icon13.svg": "302eed6196503890bfafa6fe9ac66c32",
"assets/assets/icons/icon/icon11.svg": "32127da5d5221267c80f1fe4a0799c4b",
"assets/assets/icons/icon/icon10.svg": "b3015ef6bbf68f6399d28f18e263b14a",
"assets/assets/icons/icon/icon14.svg": "81f52efcf326e05c23d01da17472190f",
"assets/assets/icons/icon/icon28.svg": "6778b5f7f54c06ad17a7c53e64863993",
"assets/assets/icons/icon/icon29.svg": "6912d36f7184ed2ecb93038fd3c43912",
"assets/assets/icons/icon/icon15.svg": "a6644cb87ba58997f929c2b5699c03e3",
"assets/assets/icons/icon/icon17.svg": "09b02130cfd80a23ddb9c32b8e813f6f",
"assets/assets/icons/icon/icon16.svg": "00597ba2e68d7a2290ddc254d33cf2c9",
"assets/assets/icons/icon/icon27.svg": "70cfbb3b0aaf8480e6c8225c0afeee61",
"assets/assets/icons/icon/icon33.svg": "45a30ff2f3507976391974fc3d220975",
"assets/assets/icons/icon/icon32.svg": "0907c48723eac01d0e1fe951392d9d90",
"assets/assets/icons/icon/icon26.svg": "21c575e2775238d5f4e19625af680743",
"assets/assets/icons/icon/icon18.svg": "7457dd5e075e10fb5a5fb92196e905e0",
"assets/assets/icons/icon/icon30.svg": "c82f556a7687100d60c881ce329fca4b",
"assets/assets/icons/icon/icon24.svg": "1a74475c910b83e13ccebcf7ac0eb4fc",
"assets/assets/icons/icon/icon25.svg": "fed6e0d82f39a4a84b68d96f07f3a3da",
"assets/assets/icons/icon/icon31.svg": "f0a7966479566919ee975f51b20311ff",
"assets/assets/icons/icon/icon19.svg": "ab8090b072fc6052ffb00abdfdf9ebdb",
"assets/assets/icons/icon/icon35.svg": "048c51a0ce017b250ff1504350b24d6d",
"assets/assets/icons/icon/icon21.svg": "5a5dd1966e2b15156db6c2ca47786a2d",
"assets/assets/icons/icon/icon20.svg": "02f80570a2bf8211faf015c1ee804a3d",
"assets/assets/icons/icon/icon34.svg": "8eca8009fde7098633de381dd71a030f",
"assets/assets/icons/icon/icon22.svg": "c6406c694425be1efcb9cbaca2b115f6",
"assets/assets/icons/icon/icon36.svg": "a7591e65d452afa08716d90ec16c5520",
"assets/assets/icons/icon/icon23.svg": "e731eb485e21a0041503713b07a764f3",
"assets/assets/icons/icon/icon4.svg": "b378a2075839f95e3c475182a29bdb49",
"assets/assets/icons/icon/icon5.svg": "5e604a9b352e7c27c00794628ba73071",
"assets/assets/icons/icon/icon7.svg": "61e188e9f3eb2b92cb3fb841dc3bcc6e",
"assets/assets/icons/icon/icon6.svg": "a3db48b3f2eb58ab0a10a46e89dd4991",
"assets/assets/icons/icon/icon2.svg": "114d7dbbea8d656c6c4c948c57691520",
"assets/assets/icons/icon/icon3.svg": "1e555b6317adbfef228502acda99e9a4",
"assets/assets/icons/icon/icon1.svg": "d88006ce257925a59b7b5105c9da8d1b",
"assets/assets/fonts/THSarabunNew.ttf": "4c9a6e3d203c26982281fdda16ab5712",
"assets/assets/fonts/THSarabun.ttf": "664bbf45a5c8c6952bfaf932280260be",
"assets/assets/data/data.json": "2d26c8dda523bdff9817628a37056214",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
